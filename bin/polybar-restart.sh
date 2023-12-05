#!/usr/bin/env bash

set -u

killall polybar &> /dev/null

for display in dp dp2 dvi hdmi; do nohup polybar "${display}" &> /dev/null & done
unset display
