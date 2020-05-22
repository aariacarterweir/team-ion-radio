#!/bin/zsh

# PARSE ARGS
while getopts b option
do
    case "${option}" in
        b) BOOT='true';;
    esac
done

# Set token
eval TOKEN=\$BOT_TOKEN_${VERSION}

# config path
CONFIG_FILE="shared/$PERSIST_DIR/config.txt"

# Permissions
chmod -R 755 shared

# Copy config file
rm -f "$CONFIG_FILE"
cp default-config.txt "$CONFIG_FILE"

# Copy playlists
rm -rf "shared/$PERSIST_DIR/Playlists"
cp -r shared/Playlists "shared/$PERSIST_DIR/Playlists"

# Clean up nohup file
rm -f "shared/$PERSIST_DIR/nohup.out"

# add bot token
sed -i "s/\[BOT_TOKEN\]/$TOKEN/" "$CONFIG_FILE"

# update owner id
sed -i "s/\[OWNER_ID\]/$OWNER_ID/" "$CONFIG_FILE"

# update prefix
sed -i "s/\[PREFIX\]/${VERSION}/" "$CONFIG_FILE"

# run the bot!
if [ "$BOOT" ]; then
  cd "shared/$PERSIST_DIR" && nohup java -Dnogui=true -jar /app/music-bot.jar &
fi

# keep alive
trap : TERM INT; sleep infinity & wait
