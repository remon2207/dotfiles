#!/usr/bin/env bash

set -eu

temp_dir='/sys/devices/platform/coretemp.0/hwmon/hwmon1'
core0="$(bat --plain "${temp_dir}/temp2_input" | awk '{print substr($0,1,3)}' | sd '(..)' '$1.')"
core1="$(bat --plain "${temp_dir}/temp3_input" | awk '{print substr($0,1,3)}' | sd '(..)' '$1.')"
core2="$(bat --plain "${temp_dir}/temp4_input" | awk '{print substr($0,1,3)}' | sd '(..)' '$1.')"
core3="$(bat --plain "${temp_dir}/temp5_input" | awk '{print substr($0,1,3)}' | sd '(..)' '$1.')"
core4="$(bat --plain "${temp_dir}/temp6_input" | awk '{print substr($0,1,3)}' | sd '(..)' '$1.')"
core5="$(bat --plain "${temp_dir}/temp7_input" | awk '{print substr($0,1,3)}' | sd '(..)' '$1.')"

average="$(echo -e "${core0}\n${core1}\n${core2}\n${core3}\n${core4}\n${core5}" | awk '{x++;sum+=$1} END {print sum/x}' | awk '{print substr($0,1,4)}')"
average_digit="$(echo -n "${average}" | wc -c)"

if [[ ${average_digit} -eq 2 ]]; then
  echo "$(echo "${average}" | sed -e 's/$/.0/')℃ "
else
  echo "${average}℃ "
fi
