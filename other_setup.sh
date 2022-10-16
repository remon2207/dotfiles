#!/usr/bin/env bash

# npm setup
source /usr/share/nvm/init-nvm.sh
nvm install --lts
npm i -g eslint_d @fsouza/prettierd @johnnymorganz/stylua-bin

# go setup
go install mvdan.cc/sh/v3/cmd/shfmt@latest
