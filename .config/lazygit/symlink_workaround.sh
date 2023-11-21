#!/usr/bin/env bash

cd "$(readlink -f .)" || return 1
$(which lazygit) "${@}"
