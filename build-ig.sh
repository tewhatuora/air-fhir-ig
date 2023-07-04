#!/bin/bash

set -e

echo running sushi ...
 ./runSushi.sh

echo running ig publisher
java -Xms2g -Xmx2g -jar input-cache/publisher.jar -ig . \
    -no-sushi
