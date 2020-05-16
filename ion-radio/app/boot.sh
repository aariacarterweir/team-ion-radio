#!/bin/sh

# make boot directory
mkdir boot

# START BOTS
sh ./start-bot.sh -v 1 -t "$BOT_TOKEN_1"
sh ./start-bot.sh -v 2 -t "$BOT_TOKEN_2"
sh ./start-bot.sh -v 3 -t "$BOT_TOKEN_3"

# clean boot directory
rmdir boot

# keep alive
trap : TERM INT; sleep infinity & wait
