#!/bin/sh

# Load default config
. ./config.txt

# Load custom config if available
if [ -f "./.env" ]; then
  . ./.env
fi
