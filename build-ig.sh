#!/bin/bash
set -e

ARGS=$(getopt -o nh --long no-proxy,sushi-only,help -- "$@")

usage() {
    echo "Usage: $0 [options]"
    echo "Builds a FHIR implementation guide. First runs Sushi compilation, followed by a IG Publisher run"
    echo
    echo "Options:"
    echo
    echo "  -n, --no-proxy   By default, if a HTTP_PROXY env variable is set, this will be used. This argument disable this behaviour."
    echo "  -s, --sushi-only Just run sushi compilation and exit. IG publisher will not be run."
    echo "  -h, --help       Display this help message, then exit."
}

eval set -- "$ARGS"

while [ : ]; do
    case "$1" in
      -n | --no-proxy)
        no_proxy="true"
        shift 1
        ;;
      -s | --sushi-only)
        sushi_only="true"
        shift 1
        ;;
      -h | --help)
        usage
        exit 0
        ;;
      --)
        shift
        break
        ;;
    esac
done

echo running sushi ...
 ./runSushi.sh

if [[ "$sushi_only" != "true" ]]; then
    JAVA_OPTS="-Xms2g -Xmx2g -Dfile.encoding=UTF-8"

    if [[ -v HTTP_PROXY && "$no_proxy" != "true" ]]; then
      IG_OPTS="-proxy ${HTTP_PROXY//http:\/\/}"
    fi

    echo running ig publisher
    java $JAVA_OPTS -jar input-cache/publisher.jar -ig . $IG_OPTS -no-sushi
fi
