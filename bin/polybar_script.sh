#!/usr/bin/env bash

set -eu

[[ ${#} -eq 0 ]] && echo 'Please specify an argument' && exit 1

vm() {
  du_vm() { du --summarize --block-size='1G' "${HOME}/VirtualBox VMs"; }

  if ! du_vm &> /dev/null; then
    echo 'is directory does not exist'
  else
    echo "$(du_vm | awk '{print $1}')G"
  fi
}

cpu_temp() {
  echo "$(bat --plain /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input | awk '{print substr($0, 1, 2)}')%"
}

case "${1}" in
  'vm')
    vm
    ;;
  'cpu-temp')
    cpu_temp
    ;;
esac
