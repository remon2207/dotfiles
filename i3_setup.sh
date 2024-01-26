#!/usr/bin/env bash

set -eu

CURRENT_DIR=$(cd "$(dirname "${0}")" && pwd)
readonly CURRENT_DIR

setup() {
  local -r home_symbolic=(
    '.curlrc'
    '.gitconfig'
    '.gtkrc-2.0'
    '.profile'
    '.ripgreprc'
    '.xinitrc'
    '.Xresources'
    '.zshrc'
    'bin'
    'commit.template'
  )
  local -r conf_symbolic=(
    'bat'
    'btop'
    'dunst'
    'fcitx5'
    'fontconfig'
    'gh'
    'gtk-3.0'
    'i3'
    'kitty'
    'Kvantum'
    'lazygit'
    'mimeapps.list'
    'neofetch'
    'nvim'
    'nvtop'
    'picom'
    'polybar'
    'qt5ct'
    'ranger'
    'rofi'
    'silicon'
    'starship.toml'
    'zsh'
  )

  rm --recursive --force "${HOME}/.xinitrc" "${HOME}/.config/"{i3,kitty}
  sudo mkdir --parents /etc/gtk-2.0 "${HOME}/.config/systemd/user"

  for home in "${home_symbolic[@]}"; do ln --symbolic --force --verbose "${CURRENT_DIR}/${home}" "${HOME}"; done
  for conf in "${conf_symbolic[@]}"; do ln --symbolic --force --verbose "${CURRENT_DIR}/.config/${conf}" "${HOME}/.config"; done
  ln --symbolic --force --verbose "${CURRENT_DIR}/.local/share/applications" "${HOME}/.local/share"

  sudo ln --symbolic --force --verbose "${CURRENT_DIR}/.gtkrc-2.0" /etc/gtk-2.0/gtkrc
  sudo ln --symbolic --force --verbose "${CURRENT_DIR}/.config/gtk-3.0/settings.ini" /etc/gtk-3.0
}

services() {
  cp --archive "${CURRENT_DIR}/.config/systemd/user/"* "${HOME}/.config/systemd/user"
  systemctl --user enable --now ssh-agent.service auto-backup.timer
}

main() {
  setup
  services

  chsh --shell "$(which zsh)"
}

main "${@}"
