#!/bin/sh

# add bot token
sed -i "s/\[BOT_TOKEN\]/$BOT_TOKEN/" ./config.txt

# update owner id
sed -i "s/\[OWNER_ID\]/$OWNER_ID/" ./config.txt

# boot the bot!
nohup java -Dnogui=true -jar music-bot.jar &

# keep alive
trap : TERM INT; sleep infinity & wait
