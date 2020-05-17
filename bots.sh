#!/bin/sh

# PARSE ARGS
while getopts fa:v: option
do
    case "${option}" in
        f) FORCE='true';;
        a) ACTION=${OPTARG};;
        v) VERSION=${OPTARG};;
    esac
done

if [ ! "$ACTION" ]; then
  echo "Action must be provided, use the -a flag. Available actions are:"
  echo "    boot - Starts the bots up from scratch if there is no pre-existing container"
  echo "    suspend - Pauses the bots"
  echo "    resume - Resumes paused bots"
  echo "    stop - Shuts down the bot containers"
  echo "    start - Starts up the bot containers"
  echo "use the -f flag to run docker system prune --force"
  exit 2
fi

if [ ! "$VERSION" ]; then
  echo "Running action '${ACTION}' for all bots"
  sh "util/${ACTION}-bot.sh" -v 1
  sh "util/${ACTION}-bot.sh" -v 2
  sh "util/${ACTION}-bot.sh" -v 3
  sh "util/${ACTION}-bot.sh" -v 4
  sh "util/${ACTION}-bot.sh" -v 5
  sh "util/${ACTION}-bot.sh" -v 6
else
  echo "Running action '${ACTION}' for bot version '${VERSION}'"
  sh "util/${ACTION}-bot.sh" -v "$VERSION"
fi

if [ "$FORCE" ]; then
  docker system prune --force
fi
