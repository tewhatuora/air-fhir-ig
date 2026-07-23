#!/bin/bash

npm install markdown remarkable

echo running sushi ...
 ./.builder/scripts/runSushi.sh
 
echo running local scripts....
 node ./.builder/scripts/makeProfilesAndExtensions.js
 node ./.builder/scripts/makeTerminologySummary.js
 node ./.builder/scripts/makeCapabilityStatement.js

