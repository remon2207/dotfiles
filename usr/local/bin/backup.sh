#!/usr/bin/env bash

pictures_directory="$HOME/Pictures"
videos_directory="$HOME/Videos"

cp -r $HOME/.ssh/config /mnt/RH/.ssh

if [ -n "$(ls $pictures_directory)" ]; then
  cp -r $HOME/Pictures/* /mnt/RH/pictures
fi

if [ -n "$(ls $videos_directory)" ]; then
  cp -r $HOME/Videos/* /mnt/RH/videos
fi
