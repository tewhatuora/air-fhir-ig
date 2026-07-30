#!/bin/bash
set -eo pipefail

npm install markdown remarkable


echo running sushi ...
    ./.builder/scripts/runSushi.sh
 
echo running local scripts....
    node ./.builder/scripts/makeProfilesAndExtensions.js
    node ./.builder/scripts/makeTerminologySummary.js
    node ./.builder/scripts/makeCapabilityStatement.js

    test -f input/pagecontent/API.xml
    # mkdir -p input/includes
    # cp input/pagecontent/API.xml input/includes/API.xml
    # test -f input/includes/API.xml
    # ls -la input/pagecontent/API.xml input/includes/API.xml

    ./.builder/scripts/openapi/generate-openapi.sh

echo "✅ pre-build.sh complete"