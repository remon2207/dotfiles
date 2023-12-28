#!/usr/bin/env bash

set -eu

scrot_base() {
  local -r current_datetime="$(date '+%Y-%m-%d_%H-%M-%S')"
  /usr/bin/scrot "${@}" --quality=100 "${HOME}/Pictures/screenshots/${current_datetime}_screenshot.png"

  return
}

main() {
  local -r window_text='Window'
  local -r select_text='Select'
  local -r all_text='All'
  local -r menus="${window_text}\n${select_text}\n${all_text}"
  local -r selected="$(echo -e "${menus}" | /usr/bin/rofi -dmenu -p 'scrot')"

  case "${selected}" in
    "${select_text}")
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
