#!/bin/sh

# add bot token
sed -i "s/\[BOT\_TOKEN\]/$BOT_TOKEN/" ./config.txt

cat ./config.txt
