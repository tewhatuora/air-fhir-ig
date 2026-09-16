#!/bin/bash
set -eo pipefail

 npm install remarkable


echo running sushi ...
    ./.builder/scripts/runSushi.sh
 
echo running local scripts....
    node ./.builder/scripts/makeCapabilityStatement.js

    test -f input/pagecontent/API.xml

    ./.builder/scripts/openapi/generate-openapi.sh

echo "✅ pre-build.sh complete"