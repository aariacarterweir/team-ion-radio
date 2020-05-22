#!/bin/zsh

# LOAD CONFIG
. util/load-config.sh

# PARSE ARGS
VERSION="$1"

# sh into container
docker exec -it "${CONTAINER_PREFIX}${VERSION}" sh
