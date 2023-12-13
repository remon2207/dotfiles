#!/usr/bin/env bash

set -eu

# ワークスペース3に移動し、レイアウトを展開する
i3-msg "workspace --no-auto-back-and-forth 3; append_layout ${XDG_CONFIG_HOME}/i3/workspace_3.json"

# 展開に必要なプログラムを起動する
(discord &)
(slack &)
(kitty --single-instance htop &)
(kitty --single-instance nvtop &)
# (wezterm start htop &)
# (wezterm start nvtop &)
