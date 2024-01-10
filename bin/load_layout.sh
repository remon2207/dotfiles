#!/usr/bin/env bash

set -eu

if [[ "${1}" == 'dvi' ]] && [[ "${2}" == 'dp2' ]] && [[ "${3}" == 'dp' ]]; then

  for num in 3 2 1; do /usr/bin/i3-msg "workspace --no-auto-back-and-forth ${num}; append_layout ${XDG_CONFIG_HOME}/i3/workspace_${num}.json"; done

  # 展開に必要なプログラムを起動する
  (/usr/bin/discord &)
  (/usr/bin/slack &)
  ("${HOME}/bin/JQuake.sh" &)
  (cd "${HOME}/src/KyoshinEewViewer" && "${HOME}/src/KyoshinEewViewer/KyoshinEewViewer" &)
  (/usr/bin/kitty --single-instance /usr/bin/btop &)
  (/usr/bin/kitty --single-instance /usr/bin/nvtop &)
  (/usr/bin/vivaldi-stable &)
elif [[ "${1}" == 'dp2' ]]; then
  # ワークスペース3に移動し、レイアウトを展開する
  /usr/bin/i3-msg "workspace --no-auto-back-and-forth 2; append_layout ${XDG_CONFIG_HOME}/i3/workspace_2.json"

  # 展開に必要なプログラムを起動する
  (/usr/bin/discord &)
  (/usr/bin/slack &)
  ("${HOME}/bin/JQuake.sh" &)
  (cd "${HOME}/src/KyoshinEewViewer" && "${HOME}/src/KyoshinEewViewer/KyoshinEewViewer" &)
elif [[ "${1}" == 'dvi' ]]; then
  # ワークスペース2に移動し、レイアウトを展開する
  /usr/bin/i3-msg "workspace --no-auto-back-and-forth 3; append_layout ${XDG_CONFIG_HOME}/i3/workspace_3.json"

  # 展開に必要なプログラムを起動する
  (/usr/bin/kitty --single-instance /usr/bin/btop &)
  (/usr/bin/kitty --single-instance /usr/bin/nvtop &)
fi
