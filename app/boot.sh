#!/bin/sh

# PARSE ARGS
while getopts b option
do
    case "${option}" in
        b) BOOT='true';;
    esac
done

# Set up persistance
sh persist.sh

# Set token
eval TOKEN=\$BOT_TOKEN_${VERSION}

# add bot token
sed -i "s/\[BOT_TOKEN\]/$TOKEN/" persist/config.txt

# update owner id
sed -i "s/\[OWNER_ID\]/$OWNER_ID/" persist/config.txt

# update prefix
sed -i "s/\[PREFIX\]/${VERSION}/" persist/config.txt

# run the bot!
if [ "$BOOT" ]; then
  cd persist && nohup java -Dnogui=true -jar /app/music-bot.jar &
fi

# keep alive
trap : TERM INT; sleep infinity & wait
