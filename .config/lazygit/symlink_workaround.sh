#!/usr/bin/env bash

cd $(readlink -f .)
$(which lazygit) "$@"
