#!/bin/zsh

# EXAMPLE USAGE
# ./build.sh -v 1.0.11 -p

# LOAD CONFIG
. util/load-config.sh

# PARSE ARGS
VERSION="$1"
while getopts p option; do
    case "${option}" in
        p) PUSH='true';;
    esac
done

# DO BUILD
docker build -t "${IMAGE_NAME}:${LATEST_TAG}" .

if [ "$VERSION" ]; then
    docker tag "${IMAGE_NAME}:${LATEST_TAG}" "${IMAGE_NAME}:${VERSION}"
fi

# DO PUSH
if [ "$PUSH" ]; then
    docker push "${IMAGE_NAME}:${LATEST_TAG}"

    if [ "$VERSION" ]; then
        docker push "${IMAGE_NAME}:${VERSION}"
    fi
fi

# CLEAN UP
docker system prune --force
