#!/bin/sh

# EXAMPLE USAGE
# sh build.sh -v 1.0.11 -p

# CONFIG
IMAGE_NAME="aariacarterweir/ion-radio"
LATEST_TAG="latest"

# PARSE ARGS
while getopts pv: option
do
    case "${option}" in
        v) VERSION=${OPTARG};;
        p) PUSH='true';;
    esac
done

# DO BUILD
docker build -t "${IMAGE_NAME}:${LATEST_TAG}" .

if [[ "$VERSION" ]]; then
    docker tag "${IMAGE_NAME}:${LATEST_TAG}" "${IMAGE_NAME}:${VERSION}"
fi

# DO PUSH
if [[ "$PUSH" ]]; then
    docker push "${IMAGE_NAME}:${LATEST_TAG}"

    if [[ "$VERSION" ]]; then
        docker push "${IMAGE_NAME}:${VERSION}"
    fi
fi

# CLEAN UP
docker system prune --force
