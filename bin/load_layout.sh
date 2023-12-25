#!/usr/bin/env bash

set -eu

if [[ "${1}" == 'dvi' ]]; then
  # ワークスペース3に移動し、レイアウトを展開する
  /usr/bin/i3-msg "workspace --no-auto-back-and-forth 3; append_layout ${XDG_CONFIG_HOME}/i3/workspace_3.json"

  # 展開に必要なプログラムを起動する
  (/usr/bin/discord &)
  (/usr/bin/slack &)
  (/usr/bin/kitty --single-instance htop &)
  # (/usr/bin/kitty --single-instance btop &)
  (/usr/bin/kitty --single-instance nvtop &)
  # (/usr/bin/wezterm start htop &)
  # (/usr/bin/wezterm start nvtop &)
elif [[ "${1}" == 'dp' ]] || [[ "${1}" == 'dvi' ]] && [[ "${2}" == 'dp' ]] || [[ "${2}" == 'dvi' ]]; then
  # ワークスペース3に移動し、レイアウトを展開する
  for num in 3 1; do /usr/bin/i3-msg "workspace --no-auto-back-and-forth ${num}; append_layout ${XDG_CONFIG_HOME}/i3/workspace_${num}.json"; done

  # 展開に必要なプログラムを起動する
  (/usr/bin/discord &)
  (/usr/bin/slack &)
  (/usr/bin/kitty --single-instance htop &)
  # (/usr/bin/kitty --single-instance btop &)
  (/usr/bin/kitty --single-instance nvtop &)
  # (/usr/bin/wezterm start htop &)
  # (/usr/bin/wezterm start nvtop &)
  (/usr/bin/vivaldi-stable &)
fi
