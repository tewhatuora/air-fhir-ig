#!/bin/bash
publisher_jar=publisher.jar
publish_option=""
input_cache_path=./input-cache/
echo Checking internet connection...
curl -sSf tx.fhir.org > /dev/null

if [ $? -eq 0 ]; then
	echo "Online"
	txoption=""
else
	echo "Offline"
	txoption="-tx n/a"
fi

if [ "$SET_IG_PUBLISH_FLAG" = "true" ]; then
    publish_option="-publish $IG_CANONICAL"
fi

echo "$txoption"
echo "$publish_option"

export JAVA_TOOL_OPTIONS="$JAVA_TOOL_OPTIONS -Dfile.encoding=UTF-8"

publisher=$input_cache_path/$publisher_jar
if test -f "$publisher"; then
	java -jar $publisher -ig . $txoption $* $publish_option -authorise-non-conformant-tx-servers

else
	publisher=../$publisher_jar
	if test -f "$publisher"; then
		java -jar $publisher -ig . $txoption $* $publish_option -authorise-non-conformant-tx-servers
	else
		echo IG Publisher NOT FOUND in input-cache or parent folder.  Please run _updatePublisher.  Aborting...
	fi
fi