#!/bin/sh

# LOAD CONFIG
. util/load-config.sh

# PARSE ARGS
while getopts v: option
do
    case "${option}" in
        v) VERSION=${OPTARG};;
    esac
done

# create persist directory if it does not exist
PERSIST_DIR_LOCAL_PATH="shared/vol-${VERSION}/${PERSIST_DIR}"
if [ ! -d $PERSIST_DIR_LOCAL_PATH ]; then
  mkdir -p $PERSIST_DIR_LOCAL_PATH
  chmod -R 755 $PERSIST_DIR_LOCAL_PATH
fi

echo "Running container ${CONTAINER_PREFIX}${VERSION}"

# docker run command
docker run \
  --detach \
  --tty \
  --mount type=bind,source="$(pwd)/$PERSIST_DIR_LOCAL_PATH","target=/app/shared/${PERSIST_DIR}" \
  --mount type=bind,source="$(pwd)/shared/Playlists",target=/app/shared/Playlists \
  --env VERSION="$VERSION" \
  --env PERSIST_DIR="$PERSIST_DIR" \
  --env-file .env \
  --name "${CONTAINER_PREFIX}${VERSION}" \
  "$IMAGE_NAME:$LATEST_TAG" \
  boot.sh -b
