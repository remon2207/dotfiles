#!/usr/bin/env bash

set -eu

[[ -s "${HOME}/Pictures/screenshots" ]] && rsync --archive --update "${HOME}/Pictures/screenshots/" /mnt/rh/pictures/screenshots
[[ -s "${HOME}/Pictures/codes" ]] && rsync --archive --update "${HOME}/Pictures/codes/" /mnt/rh/pictures/codes
[[ -s "${HOME}/Videos" ]] && rsync --archive --update "${HOME}/Videos/" /mnt/rh/videos
[[ -s "${HOME}/.ssh" ]] && rsync --archive --update --delete --exclude='known*' "${HOME}/.ssh/" /mnt/rh/ssh
