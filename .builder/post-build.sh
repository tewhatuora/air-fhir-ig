#!/bin/bash
set -eo pipefail

echo Add ing custom history
./.builder/scripts/post_updateHistory.sh

if [[ ${ENV} == "uat" || ${ENV} == "prod" ]]; then
    echo Update uat domain urls
    ./.builder/scripts/post_updateurls.sh
fi;

echo running PlantUML ...
 ./.builder/scripts/genPlantumlImages.sh

echo running raw image generation ...
./.builder/scripts/genRawImages.sh

echo versioning ImmSotAPI.yaml

VERSION=$(yq '.version' sushi-config.yaml)
yq -i ".info.version |= \"${VERSION}\"" immsot-ig-template-local/package/content/ImmSoTAPI.yaml

./.builder/scripts/transform_to_marketplace_spec.sh

# copy the openapi spec into the published outputs
cp immsot-ig-template-local/package/content/*.yaml output

echo "✅ post-build.sh complete"