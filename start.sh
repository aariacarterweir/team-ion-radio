#!/bin/sh

docker run \
  --detach \
  --tty \
  --env-file .env \
  --mount  type=bind,source="$(pwd)"/app,target=/app \
  --name ion-radio \
  aariacarterweir/ion-radio:latest \
  boot.sh
