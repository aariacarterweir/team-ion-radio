#!/bin/sh

# PARSE ARGS
while getopts fa: option
do
    case "${option}" in
        f) FORCE='true';;
        a) ACTION=${OPTARG};;
    esac
done

if [ ! "$ACTION" ]; then
  echo "Action must be provided, use the -a flag. Available actions are start, stop, revive, pause, unpause"
  echo "use the -f flag to clean up during a stop operation"
  exit 2
fi

sh "util/${ACTION}-bot.sh" -v 1
sh "util/${ACTION}-bot.sh" -v 2
sh "util/${ACTION}-bot.sh" -v 3
sh "util/${ACTION}-bot.sh" -v 4
sh "util/${ACTION}-bot.sh" -v 5
sh "util/${ACTION}-bot.sh" -v 6

if [ "$FORCE" ]; then
  docker system prune --force
fi
