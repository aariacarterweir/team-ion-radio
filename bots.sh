#!/bin/zsh

# Load config
. util/load-config.sh

# PARSE ARGS
ACTION="$1"
VERSION="$2"

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
  setopt shwordsplit
  for v in $BOTS; do
    zsh "util/bot-${ACTION}.sh" "$v"
  done
else
  echo "Running action '${ACTION}' for bot version '${VERSION}'"
  zsh "util/bot-${ACTION}.sh" "$VERSION"
fi
