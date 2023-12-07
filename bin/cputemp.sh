#!/usr/bin/env bash

set -eu

core="$(bat --plain /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp[2-7]_input | awk '{print substr($0,1,3)}' | sd '^(..)' "\$1.")"
average="$(echo "${core}" | awk '{x++;sum+=$1} END {print sum/x}' | awk '{print substr($0,1,4)}')"
average_digit="$(echo -n "${average}" | wc --bytes)"

case ${average_digit} in
2)
  echo "${average}" | sd '$' '.0℃'
  ;;
*)
  echo "${average}℃"
  ;;
esac
