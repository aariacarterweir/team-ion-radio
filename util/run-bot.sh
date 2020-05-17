#!/bin/sh

# PARSE ARGS
while getopts v: option
do
    case "${option}" in
        v) VERSION=${OPTARG};;
    esac
done

# create persist directory if it does not exist
if [ ! -d ".persist/${VERSION}" ]; then
  mkdir ".persist/${VERSION}"
  chmod -R 755 ".persist/${VERSION}"
fi

# docker run command
docker run \
  --detach \
  --tty \
  --mount  type=bind,source="$(pwd)/.persist/${VERSION}",target=/app/persist \
  --env VERSION="$VERSION" \
  --env-file .env \
  --name "ion-radio-${VERSION}" \
  aariacarterweir/ion-radio:latest \
  boot.sh -b
