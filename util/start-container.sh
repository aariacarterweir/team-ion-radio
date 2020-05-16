#!/bin/sh

# PARSE ARGS
while getopts v: option
do
    case "${option}" in
        v) VERSION=${OPTARG};;
    esac
done

docker run \
  --detach \
  --tty \
  --env VERSION="$VERSION" \
  --env-file .env \
  --mount  type=bind,source="$(pwd)"/app,target=/app \
  --name "ion-radio-${VERSION}" \
  aariacarterweir/ion-radio:latest \
  boot.sh
