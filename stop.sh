#!/bin/sh

sh util/stop-container.sh -v 1
sh util/stop-container.sh -v 2
sh util/stop-container.sh -v 3
sh util/stop-container.sh -v 4
sh util/stop-container.sh -v 5

docker system prune --force
