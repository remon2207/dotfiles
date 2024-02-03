#!/usr/bin/env bash

set -eu

show_action() {
  feh "${HOME}/Pictures/screenshots/${1}"
}

scrot_base() {
  local -r photo_file="$(date '+%Y-%m-%d_%H-%M-%S')_screenshot.png"

  [[ ! -d "${HOME}/Pictures/screenshots" ]] && mkdir --parents "${HOME}/Pictures/screenshots"

  scrot "${@}" --quality=100 --compression=9 "${HOME}/Pictures/screenshots/${photo_file}"
  action="$(dunstify --action='default,show' 'スクリーンショットを保存' "${photo_file}")"

  case "${action}" in
    'default')
      show_action "${photo_file}"
      ;;
  esac

  return
}

main() {
  local -r window_text='ウィンドウ'
  local -r select_text='選択'
  local -r all_text='全て'
  local -r menus="${window_text}\n${select_text}\n${all_text}"
  local -r selected="$(echo -e "${menus}" | rofi -dmenu -l 3 -p 'scrot')"

  case "${selected}" in
    "${select_text}")
      scrot_base '--select' '--delay=1'
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
