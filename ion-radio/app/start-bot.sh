#!/bin/sh

# PARSE ARGS
while getopts v:t: option
do
    case "${option}" in
        v) VERSION=${OPTARG};;
        t) TOKEN=${OPTARG};;
    esac
done

# add bot token
sed -i "s/\[BOT_TOKEN\]/$TOKEN/" "bot-${VERSION}/config.txt"

# update owner id
sed -i "s/\[OWNER_ID\]/$OWNER_ID/" "bot-${VERSION}/config.txt"

# boot the bot!
cd "bot-${VERSION}" && nohup java -Dnogui=true -jar /app/music-bot.jar &
cd ..
