#!/usr/bin/env bash

set -eu

cp --archive --force "${HOME}/Pictures/"* /mnt/share01/rh/pictures
cp --archive --force "${HOME}/Videos/"* /mnt/share01/rh/videos
cp --archive --force "${HOME}/.ssh/"* /mnt/share01/rh/ssh
