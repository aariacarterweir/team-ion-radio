#!/bin/sh

## BOT 1
sh ./start-bot.sh -v 1 -t "$BOT_TOKEN_1"

# keep alive
trap : TERM INT; sleep infinity & wait
