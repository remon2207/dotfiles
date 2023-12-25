#!/usr/bin/env bash

set -eu

/usr/bin/rsync --archive --update "${HOME}/Pictures/" /mnt/share01/rh/pictures
/usr/bin/rsync --archive --update "${HOME}/Videos/" /mnt/share01/rh/videos
/usr/bin/rsync --archive --update --delete --exclude='known*' "${HOME}/.ssh/" /mnt/share01/rh/ssh
