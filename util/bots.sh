#!/bin/sh

# PARSE ARGS
while getopts a:v: option
do
    case "${option}" in
        a) ACTION=${OPTARG};;
        v) VERSION=${OPTARG};;
    esac
done


# Check for valid action flag
if [ ! "$ACTION" ]; then
  echo "Action must be provided, use the -a flag. Available actions are:"
  echo "    run - Starts the bots up"
  echo "    stop - Shuts down the bot containers and removes them"
  echo "    exec - Opens interactive shell in a container. Version must be supplied"
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
  sh "util/bot-${ACTION}.sh" -v d4t
  sh "util/bot-${ACTION}.sh" -v n3l
  sh "util/bot-${ACTION}.sh" -v m4l
  sh "util/bot-${ACTION}.sh" -v b3p
  sh "util/bot-${ACTION}.sh" -v s3d
  sh "util/bot-${ACTION}.sh" -v c4p
  sh "util/bot-${ACTION}.sh" -v j4k
  sh "util/bot-${ACTION}.sh" -v r1t
  sh "util/bot-${ACTION}.sh" -v t3p
else
  echo "Running action '${ACTION}' for bot version '${VERSION}'"
  . "util/bot-${ACTION}.sh" -v "$VERSION"
fi
