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

  (wezterm --config=disable_default_key_bindings=true start nvtop &)
  (wezterm --config=disable_default_key_bindings=true start btop &)
elif [[ "${1}" == 'dp' ]] && [[ "${2}" == 'dp2' ]] && [[ "${3}" == 'dvi' ]]; then
  for num in 3 2 1; do i3-msg "workspace --no-auto-back-and-forth ${num}; append_layout ${XDG_CONFIG_HOME}/i3/workspace_${num}.json"; done

  ([[ "$(ps aux | rg 'Discord' | rg --invert-match 'rg' | wc --lines)" -eq 0 ]] && discord --start-minimized &)
  (slack &)
  (kevi.sh &)
  (JQuake.sh &)
  (wezterm --config=disable_default_key_bindings=true start nvtop &)
  (wezterm --config=disable_default_key_bindings=true start btop &)
  (google-chrome-stable &)
  (sleep 1 && for display in dp dp2 dvi hdmi; do polybar "${display}" & done &)
fi
