#!/usr/bin/env bash

set -eu

core="$(/usr/bin/bat --plain /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp[2-7]_input | /usr/bin/awk '{print substr($0,1,3)}' | /usr/bin/sd '^(..)' "\$1.")"
average="$(echo "${core}" | /usr/bin/awk '{x++;sum+=$1} END {print sum/x}' | /usr/bin/awk '{print substr($0,1,4)}')"
average_digit="$(echo -n "${average}" | /usr/bin/wc --bytes)"

case ${average_digit} in
  2)
    echo "${average}" | /usr/bin/sd '$' '.0℃'
    ;;
  *)
    echo "${average}℃"
    ;;
esac
