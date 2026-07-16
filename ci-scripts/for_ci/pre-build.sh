#!/bin/bash

## ci-scripts/pre-build.sh
## @TODO check

file="sushi-config.yaml"
releaseLabel=$(yq .releaseLabel $file)

if [[ $RELEASE = "true" && $releaseLabel = "ci-build" ]]
  then
    echo "updating sushi config file for release"
    yq -i '(.status = "active" | .releaseLabel = "release")' $file
    echo "MVN_IG_VERSION=$(yq .version $file)" >> version.env
elif [[ $RELEASE != "true" && $releaseLabel = "release" ]]
  then
    echo "invalid scenario"
    exit 1
else
  echo "MVN_IG_VERSION=$(yq .version $file)-SNAPSHOT" >> version.env
fi

echo "Maven artefact version: ${MVN_IG_VERSION}"

# @TODO if release?
VERSION=$(yq '.version' sushi-config.yaml)
yq -i ".info.version |= \"${VERSION}\"" immsot-ig-template-local/package/content/ImmSoTAPI.yaml

