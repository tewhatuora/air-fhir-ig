#!/bin/bash +x
set -euxo pipefail

OPENAPI_OUTPUT_DIR="openapi"
FSH_CAPABILITY_STATEMENT="input/fsh/capabilitystatement.fsh"
OPENAPI_SCRIPTS_DIR="./.builder/scripts/openapi"

npm install --prefix $OPENAPI_SCRIPTS_DIR

(cd $OPENAPI_SCRIPTS_DIR; npm ci --silent)

mkdir -p "$OPENAPI_OUTPUT_DIR"

node $OPENAPI_SCRIPTS_DIR/generate-openapi.js \
    --input "$FSH_CAPABILITY_STATEMENT" \
    --output "$OPENAPI_OUTPUT_DIR/air-immsot-api.yaml" \
    --format yaml

node $OPENAPI_SCRIPTS_DIR/generate-openapi.js \
    --input "$FSH_CAPABILITY_STATEMENT" \
    --output "$OPENAPI_OUTPUT_DIR/air-immsot-api.json" \
    --format json

npx --yes @apidevtools/swagger-cli@4 validate \
    "$OPENAPI_OUTPUT_DIR/air-immsot-api.yaml"

FSH_VER=$(grep '^\* version' "$FSH_CAPABILITY_STATEMENT" \
        | head -1 \
        | sed 's/.*"\(.*\)".*/\1/')

YAML_VER=$(node -e "
    const y = require('$OPENAPI_SCRIPTS_DIR/node_modules/js-yaml');
    const f = require('fs');
    const doc = y.load(f.readFileSync('$OPENAPI_OUTPUT_DIR/air-immsot-api.yaml','utf8'));
    console.log(doc.info.version);
")

echo "FSH version : $FSH_VER"
echo "YAML version: $YAML_VER"

if [ "$FSH_VER" != "$YAML_VER" ]; then
    echo "ERROR: version mismatch - re-run the generator after bumping the FSH version"
    exit 1
fi

echo "OK: versions match ($FSH_VER)"
