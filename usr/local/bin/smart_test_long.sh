#!/usr/bin/env bash

set -u

device="${1:-null}"

[[ "${device}" == 'null' ]] && exit 1

smartctl --test='long' "${device}"

while true; do
  hdparm -B 255 "${device}"
  hdparm -S 0 "${device}"
  sleep 10m
done
