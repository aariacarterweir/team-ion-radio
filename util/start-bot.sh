#!/bin/sh

# PARSE ARGS
while getopts v: option
do
    case "${option}" in
        v) VERSION=${OPTARG};;
    esac
done

docker start "ion-radio-${VERSION}"
docker exec -d "ion-radio-${VERSION}" ./boot.sh -b
