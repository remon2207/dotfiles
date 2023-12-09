#!/usr/bin/env bash

set -eu

i3-msg 'restart'
sleep 0.1
i3-msg 'workspace 1'
