#!/bin/sh

# PARSE ARGS
while getopts pca:v: option
do
    case "${option}" in
        p) PRUNE='true';;
        c) CLEAN='true';;
        a) ACTION=${OPTARG};;
        v) VERSION=${OPTARG};;
    esac
done

# ensure global persist directory exists
if [ ! -d "persist" ]; then
  mkdir persist
  chmod -R 755 persist
fi

# Check for valid action flag
if [ ! "$ACTION" ]; then
  echo "Action must be provided, use the -a flag. Available actions are:"
  echo "    run - Starts the bots up from scratch if there is no pre-existing container"
  echo "    pause - Pauses the bots"
  echo "    unpause - Resumes paused bots"
  echo "    stop - Shuts down the bot containers"
  echo "    start - Starts up the bot containers"
  echo "Other available flags are:"
  echo "    use the -v flag to specify a version"
  echo "    use the -p flag to run docker system prune"
  echo "    use the -c flag to run docker system prune -a"
  exit 2
fi

# Run for either all versions or a specific version
if [ ! "$VERSION" ]; then
  echo "Running action '${ACTION}' for all bots"
  sh "util/${ACTION}-bot.sh" -v d4t
  sh "util/${ACTION}-bot.sh" -v n3l
  sh "util/${ACTION}-bot.sh" -v m4l
  sh "util/${ACTION}-bot.sh" -v b3p
  sh "util/${ACTION}-bot.sh" -v s3d
  sh "util/${ACTION}-bot.sh" -v c4p
  sh "util/${ACTION}-bot.sh" -v j4k
else
  echo "Running action '${ACTION}' for bot version '${VERSION}'"
  sh "util/${ACTION}-bot.sh" -v "$VERSION"
fi

# Check if we should system prune
if [ "$PRUNE" ]; then
  docker system prune --force
fi

# Check if we should system prune EVERYTHING
if [ "$CLEAN" ]; then
  docker system prune -a --force
fi
