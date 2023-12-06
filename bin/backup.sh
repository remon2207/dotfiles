#!/usr/bin/env bash

set -eu

rsync --archive --update --delete "${HOME}/Pictures/"* /mnt/share01/rh/pictures
rsync --archive --update --delete "${HOME}/Videos/"* /mnt/share01/rh/videos
rsync --archive --update --delete "${HOME}/.ssh/"* /mnt/share01/rh/ssh
