#!/usr/bin/env bash

set -eu

cp -af --archive --force "${HOME}/Pictures/"* /mnt/share01/rh/pictures
cp -af --archive --force "${HOME}/Videos/"* /mnt/share01/rh/videos
cp -af --archive --force "${HOME}/.ssh/"* /mnt/share01/rh/ssh
