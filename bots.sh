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

# Check for valid action flag
if [ ! "$ACTION" ]; then
  echo "Action must be provided, use the -a flag. Available actions are:"
  echo "    run - Starts the bots up"
  echo "    stop - Shuts down the bot containers and removes them"
  echo "Other available flags are:"
  echo "    use the -v flag to specify a version"
  exit 2
fi

if [ "$ACTION" = "exec" ] && [ ! "$VERSION" ]; then
  echo "Version must be supplied using -v flag to run exec command"
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
  sh "util/${ACTION}-bot.sh" -v r1t
  sh "util/${ACTION}-bot.sh" -v t3p
else
  echo "Running action '${ACTION}' for bot version '${VERSION}'"
  . "util/${ACTION}-bot.sh" -v "$VERSION"
fi
