#!/bin/sh

# Copy config file
rm -f persist/config.txt
cp assets/config.txt persist/config.txt

# Copy playlists
rm -rf persist/Playlists
cp -r assets/Playlists persist/Playlists

# Clean up nohup file
rm -f persist/nohup.out
