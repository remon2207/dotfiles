#!/usr/bin/env bash

sudo pacman -S --noconfirm base-devel

cd $(dirname $0)
./arch_setup.sh
