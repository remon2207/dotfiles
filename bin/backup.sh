#!/usr/bin/env bash

set -eu

rsync --archive --update "${HOME}/Pictures/" /mnt/share01/rh/pictures
rsync --archive --update "${HOME}/Videos/" /mnt/share01/rh/videos
rsync --archive --update --delete --exclude='known*' "${HOME}/.ssh/" /mnt/share01/rh/ssh
