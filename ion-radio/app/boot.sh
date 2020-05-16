#!/bin/sh

# START BOTS
sh ./start-bot.sh -v 1 -t "$BOT_TOKEN_1"
sh ./start-bot.sh -v 2 -t "$BOT_TOKEN_2"
sh ./start-bot.sh -v 3 -t "$BOT_TOKEN_3"

# keep alive
trap : TERM INT; sleep infinity & wait
