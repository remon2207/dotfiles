#!/usr/bin/env bash

set -eu

# ワークスペース3に移動し、レイアウトを展開する
for num in 3 1; do i3-msg "workspace --no-auto-back-and-forth ${num}; append_layout ${XDG_CONFIG_HOME}/i3/workspace_${num}.json"; done

# 展開に必要なプログラムを起動する
(discord &)
(slack &)
(kitty --single-instance htop &)
(kitty --single-instance nvtop &)
# (wezterm start htop &)
# (wezterm start nvtop &)
(vivaldi-stable &)
