#!/bin/sh

docker container stop ion-radio
docker system prune --force

rm -rf app/boot
