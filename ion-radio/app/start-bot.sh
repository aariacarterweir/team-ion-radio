#!/bin/sh

# PARSE ARGS
while getopts v:t: option
do
    case "${option}" in
        v) VERSION=${OPTARG};;
        t) TOKEN=${OPTARG};;
    esac
done

cp ./config.txt boot/config.txt

# add bot token
sed -i "s/\[BOT_TOKEN\]/$TOKEN/" "boot/config.txt"

# update owner id
sed -i "s/\[OWNER_ID\]/$OWNER_ID/" "boot/config.txt"

# update prefix
sed -i "s/\[PREFIX\]/\-${VERSION}/" "boot/config.txt"

# boot the bot!
#cd boot && nohup java -Dnogui=true -jar /app/music-bot.jar &

# clear up boot
rm boot/config.txt
