#!/usr/bin/env bash

set -eu

rsync --archive --update "${HOME}/Pictures/screenshots/" /mnt/share/rh/pictures/screenshots
rsync --archive --update "${HOME}/Videos/" /mnt/share/rh/videos
rsync --archive --update --delete --exclude='known*' "${HOME}/.ssh/" /mnt/share/rh/ssh
