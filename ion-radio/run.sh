#!/bin/sh

docker run \
  --env-file .env \
  --mount  type=bind,source="$(pwd)"/app,target=/app \
  aariacarterweir/ion-radio:latest \
  boot.sh
