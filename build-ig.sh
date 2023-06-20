#!/bin/bash

set -e

echo running sushi ...
 ./runSushi.sh

echo running ig publisher
java -Xms2g -Xmx2g -jar input-cache/publisher.jar -ig . \
    -proxy WebProxy-80fef376c00ea74f.elb.ap-southeast-2.amazonaws.com:3128 \
    -no-sushi
