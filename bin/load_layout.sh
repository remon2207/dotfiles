#!/usr/bin/env bash

set -eu

if [[ "${1}" == 'dp2' ]]; then
  i3-msg "workspace --no-auto-back-and-forth 2; append_layout ${XDG_CONFIG_HOME}/i3/workspace_2.json"

  ([[ "$(ps aux | rg 'Discord' | rg --invert-match 'rg' | wc --lines)" -eq 0 ]] && discord --start-minimized &)
  (slack &)
  (kevi.sh &)
  (JQuake.sh &)
elif [[ "${1}" == 'dvi' ]]; then
  i3-msg "workspace --no-auto-back-and-forth 3; append_layout ${XDG_CONFIG_HOME}/i3/workspace_3.json"

  (kitty --override=clear_all_shortcuts=yes --single-instance nvtop &)
  (kitty --override=clear_all_shortcuts=yes --single-instance btop &)
elif [[ "${1}" == 'dp' ]] && [[ "${2}" == 'dp2' ]] && [[ "${3}" == 'dvi' ]]; then
  for num in 3 2 1; do i3-msg "workspace --no-auto-back-and-forth ${num}; append_layout ${XDG_CONFIG_HOME}/i3/workspace_${num}.json"; done

  ([[ "$(ps aux | rg 'Discord' | rg --invert-match 'rg' | wc --lines)" -eq 0 ]] && discord --start-minimized &)
  (slack &)
  (kevi.sh &)
  (JQuake.sh &)
  (kitty --override=clear_all_shortcuts=yes --single-instance nvtop &)
  (kitty --override=clear_all_shortcuts=yes --single-instance btop &)
  (sleep 8 && google-chrome-stable &)
fi
