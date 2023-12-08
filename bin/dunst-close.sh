#!/usr/bin/env bash

set -eu

if [[ ${#} -eq 0 ]]; then
  dunstctl close
elif [[ "${1}" == '-a' ]]; then
  dunstctl close-all
fi
