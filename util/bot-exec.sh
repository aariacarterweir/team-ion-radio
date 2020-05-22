#!/bin/bash

# LOAD CONFIG
. util/load-config.sh

# PARSE ARGS
while getopts v: option
do
    case "${option}" in
        v) VERSION=${OPTARG};;
    esac
done

# sh into container
docker exec -it "${CONTAINER_PREFIX}${VERSION}" sh
