#!/bin/sh

# Set token
eval TOKEN=\$BOT_TOKEN_${VERSION}

# clean up any previous attempts
rm -rf runtime/*

# make runtime directory
mkdir runtime

# copy main config.txt into runtime subfolder
cp ./config.txt runtime/config.txt

# add bot token
sed -i "s/\[BOT_TOKEN\]/$TOKEN/" runtime/config.txt

# update owner id
sed -i "s/\[OWNER_ID\]/$OWNER_ID/" runtime/config.txt

# update prefix
sed -i "s/\[PREFIX\]/\-${VERSION}/" runtime/config.txt

# runtime the bot!
cd runtime/ && nohup java -Dnogui=true -jar /app/music-bot.jar &

# keep alive
trap : TERM INT; sleep infinity & wait
