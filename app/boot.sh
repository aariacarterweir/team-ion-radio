#!/bin/sh

# Set token
eval TOKEN=\$BOT_TOKEN_${VERSION}

# add bot token
sed -i "s/\[BOT_TOKEN\]/$TOKEN/" config.txt

# update owner id
sed -i "s/\[OWNER_ID\]/$OWNER_ID/" config.txt

# update prefix
sed -i "s/\[PREFIX\]/\-${VERSION}/" config.txt

# runtime the bot!
nohup java -Dnogui=true -jar /app/music-bot.jar &

# keep alive
trap : TERM INT; sleep infinity & wait
