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
  echo "\x1b[35m""Action must be provided, use the -a flag. Available actions are:"
  echo "    \x1b[95m""boot\x1b[35m - Starts the bots up from scratch if there is no pre-existing container"
  echo "    \x1b[95m""suspend\x1b[35m - Pauses the bots"
  echo "    \x1b[95m""resume\x1b[35m - Resumes paused bots"
  echo "    \x1b[95m""stop\x1b[35m - Shuts down the bot containers"
  echo "    \x1b[95m""start\x1b[35m - Starts up the bot containers"
  echo "use the \x1b[95m-f\x1b[35m flag to run \x1b[91m""docker system prune --force"
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
