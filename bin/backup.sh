#!/usr/bin/env bash

set -eu

pictures_directory="${HOME}/Pictures"
videos_directory="${HOME}/Videos"

if [[ -n $(ls "${pictures_directory}") ]]; then
  cp -r "${HOME}/Pictures/*" /mnt/share01/rh/pictures/
fi

if [[ -n $(ls "${videos_directory}") ]]; then
  cp -r "${HOME}/Videos/*" /mnt/share01/rh/videos/
fi
