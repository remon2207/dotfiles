#!/usr/bin/env bash

set -eu

if [[ "${1}" == 'dp2' ]]; then
  # ワークスペース2に移動し、レイアウトを展開する
  i3-msg "workspace --no-auto-back-and-forth 2; append_layout ${XDG_CONFIG_HOME}/i3/workspace_2.json"

  # 展開に必要なプログラムを起動する
  (discord &)
  (slack &)
  (JQuake.sh &)
elif [[ "${1}" == 'dvi' ]]; then
  # ワークスペース3に移動し、レイアウトを展開する
  i3-msg "workspace --no-auto-back-and-forth 3; append_layout ${XDG_CONFIG_HOME}/i3/workspace_3.json"

  # 展開に必要なプログラムを起動する
  (kitty --single-instance btop &)
  (kitty --single-instance nvtop &)
elif [[ "${1}" == 'dp' ]] && [[ "${2}" == 'dp2' ]] && [[ "${3}" == 'dvi' ]]; then
  # ワークスペース1,2,3に移動し、レイアウトを展開する
  for num in 3 2 1; do i3-msg "workspace --no-auto-back-and-forth ${num}; append_layout ${XDG_CONFIG_HOME}/i3/workspace_${num}.json"; done

  # 展開に必要なプログラムを起動する
  (discord &)
  (slack &)
  (JQuake.sh &)
  (kitty --single-instance btop &)
  (kitty --single-instance nvtop &)
  (google-chrome-stable &)
fi
