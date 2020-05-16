#!/bin/sh

# PARSE ARGS
while getopts v:t: option
do
    case "${option}" in
        v) VERSION=${OPTARG};;
        t) TOKEN=${OPTARG};;
    esac
done


# make a boot subfolder
mkdir "boot/${VERSION}"

# store easy path to config.txt
BOOT_FOLDER="boot/${VERSION}"

# clean up any previous attempts
rm "${BOOT_FOLDER}/*"

# copy main config.txt into boot subfolder
cp ./config.txt "${BOOT_FOLDER}/config.txt"

# add bot token
sed -i "s/\[BOT_TOKEN\]/$TOKEN/" "${BOOT_FOLDER}/config.txt"

# update owner id
sed -i "s/\[OWNER_ID\]/$OWNER_ID/" "${BOOT_FOLDER}/config.txt"

# update prefix
sed -i "s/\[PREFIX\]/\-${VERSION}/" "${BOOT_FOLDER}/config.txt"

# boot the bot!
cd "${BOOT_FOLDER}/" && nohup java -Dnogui=true -jar /app/music-bot.jar &
