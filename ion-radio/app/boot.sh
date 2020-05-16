#!/bin/sh

# add bot token
sed -i "s/\[BOT_TOKEN\]/$BOT_TOKEN/" ./config.txt

cat ./config.txt
