#!/bin/bash

## ci-scripts/pre-build.sh

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

## ** sushi-config.yaml needs a commit
## @TODO Check

## build_ig.sh
echo running sushi ...
 ./runSushi.sh
 
echo running local scripts....
 node ./localscripts/makeProfilesAndExtensions.js
 node ./localscripts/makeTerminologySummary.js
 node ./localscripts/makeCapabilityStatement.js

