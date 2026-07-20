#!/bin/bash

## build-ig.sh
echo running PlantUML ...
 ./_genPlantumlImages.sh

echo running raw image geenration ...
./_genRawImages.sh

echo versioning ImmSotAPI.yaml

## @TODO moved to projects pre-build
#VERSION=$(yq '.version' sushi-config.yaml)
#yq -i ".info.version |= \"${VERSION}\"" immsot-ig-template-local/package/content/ImmSoTAPI.yaml


##  .gitlab-ci.xml
./transform_to_marketplace_spec.sh
