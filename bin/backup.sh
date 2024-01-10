#!/usr/bin/env bash

set -eu

/usr/bin/rsync --archive --update "${HOME}/Pictures/" /mnt/share/rh/pictures
/usr/bin/rsync --archive --update "${HOME}/Videos/" /mnt/share/rh/videos
/usr/bin/rsync --archive --update --delete --exclude='known*' "${HOME}/.ssh/" /mnt/share/rh/ssh
