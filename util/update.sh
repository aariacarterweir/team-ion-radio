#!/bin/zsh

git reset --hard HEAD
git pull origin master
docker pull aariacarterweir/ion-radio:latest
