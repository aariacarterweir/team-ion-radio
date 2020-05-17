#!/bin/sh

# Copy config file
rm -f persist/config.txt
cp config.txt persist/config.txt

# Copy playlists
rm -rf persist/Playlists
cp -r Playlists persist/Playlists

# Clean up nohup file
rm -f persist/nohup.out
