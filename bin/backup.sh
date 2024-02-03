#!/usr/bin/env bash

set -eu

[[ -s "${HOME}/Pictures/screenshots" ]] && rsync --recursive --links --perms --times -D --update "${HOME}/Pictures/screenshots/" /mnt/rh/pictures/screenshots
[[ -s "${HOME}/Pictures/codes" ]] && rsync --recursive --links --perms --times -D --update "${HOME}/Pictures/codes/" /mnt/rh/pictures/codes
[[ -s "${HOME}/Pictures/wallpaper" ]] && rsync --recursive --links --perms --times -D --update "${HOME}/Pictures/wallpaper/" /mnt/rh/pictures/wallpaper
[[ -s "${HOME}/Videos" ]] && rsync --recursive --links --perms --times -D --update "${HOME}/Videos/" /mnt/rh/videos
[[ -s "${HOME}/.ssh" ]] && rsync --recursive --links --perms --times -D --update --delete --exclude='known*' "${HOME}/.ssh/" /mnt/rh/ssh
