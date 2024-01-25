#!/usr/bin/env bash

set -eu

rsync --archive --update "${HOME}/Pictures/screenshots/" /mnt/rh/pictures/screenshots
rsync --archive --update "${HOME}/Videos/" /mnt/rh/videos
rsync --archive --update --delete --exclude='known*' "${HOME}/.ssh/" /mnt/rh/ssh
