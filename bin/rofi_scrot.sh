#!/usr/bin/env bash

set -eu

scrot_base() {
  local -r current_datetime="$(date '+%Y-%m-%d_%H-%M-%S')"
  /usr/bin/scrot "${@}" --quality=100 "${HOME}/Pictures/screenshots/${current_datetime}_screenshot.png"

  return
}

main() {
  local -r window_text='ウィンドウ'
  local -r select_text='選択'
  local -r all_text='全て'
  local -r menus="${window_text}\n${select_text}\n${all_text}"
  local -r selected="$(echo -e "${menus}" | /usr/bin/rofi -dmenu -l 3 -p 'scrot')"

  case "${selected}" in
    "${select_text}")
      sleep 0.2
      scrot_base '--select'
      ;;
    "${window_text}")
      scrot_base '--focused'
      ;;
    "${all_text}")
      scrot_base
      ;;
  esac

  return
}

main "${@}"
