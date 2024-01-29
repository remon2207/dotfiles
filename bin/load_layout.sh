#!/usr/bin/env bash

set -eu

if [[ "${1}" == 'dp2' ]]; then
  i3-msg "workspace --no-auto-back-and-forth 2; append_layout ${XDG_CONFIG_HOME}/i3/workspace_2.json"

  ([[ -z "$(ps --no-headers -C Discord)" ]] && discord --start-minimized &)
  (slack &)
  (KyoshinEewViewer.sh &)
  (JQuake.sh &)
elif [[ "${1}" == 'dvi' ]]; then
  i3-msg "workspace --no-auto-back-and-forth 3; append_layout ${XDG_CONFIG_HOME}/i3/workspace_3.json"

  (kitty --single-instance btop &)
  (kitty --single-instance nvtop &)
elif [[ "${1}" == 'dp' ]] && [[ "${2}" == 'dp2' ]] && [[ "${3}" == 'dvi' ]]; then
  for num in 3 2 1; do i3-msg "workspace --no-auto-back-and-forth ${num}; append_layout ${XDG_CONFIG_HOME}/i3/workspace_${num}.json"; done

  ([[ -z "$(ps --no-headers -C Discord)" ]] && discord --start-minimized &)
  (slack &)
  (KyoshinEewViewer.sh &)
  (JQuake.sh &)
  (kitty --single-instance btop &)
  (kitty --single-instance nvtop &)
  (google-chrome-stable &)
fi
