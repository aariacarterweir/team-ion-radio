#!/bin/sh

# LOAD CONFIG
. load-config.sh

# PARSE ARGS
while getopts v: option
do
    case "${option}" in
        v) VERSION=${OPTARG};;
    esac
done

echo "Stopping container:"
docker container stop "${CONTAINER_PREFIX}${VERSION}"
echo "Removing container:"
docker rm "${CONTAINER_PREFIX}${VERSION}"
