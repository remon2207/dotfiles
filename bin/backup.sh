#!/usr/bin/env bash

set -eu

[[ -s "${HOME}/Pictures/screenshots" ]] && rsync --recursive --update "${HOME}/Pictures/screenshots/" /mnt/nfs/rh/pictures/screenshots/
[[ -s "${HOME}/Pictures/codes" ]] && rsync --recursive --update "${HOME}/Pictures/codes/" /mnt/nfs/rh/pictures/codes/
[[ -s "${HOME}/Pictures/wallpaper" ]] && rsync --recursive --update "${HOME}/Pictures/wallpaper/" /mnt/nfs/rh/pictures/wallpaper/
[[ -s "${HOME}/Videos" ]] && rsync --recursive --update "${HOME}/Videos/" /mnt/nfs/rh/videos/
[[ -s "${HOME}/.ssh" ]] && rsync --recursive --update --delete --exclude='known*' "${HOME}/.ssh/" /mnt/nfs/rh/ssh/
