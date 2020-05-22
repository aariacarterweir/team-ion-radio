#!/bin/zsh

# LOAD CONFIG
. util/load-config.sh

# PARSE ARGS
VERSION="$1"

echo "Stopping container:"
docker container stop "${CONTAINER_PREFIX}${VERSION}"
echo "Removing container:"
docker rm "${CONTAINER_PREFIX}${VERSION}"
