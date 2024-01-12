#!/usr/bin/env bash

set -eu

current_dir=$(cd "$(dirname "${0}")" && pwd)

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
    'dunst'
    'fcitx5'
    'fontconfig'
    'gh'
    'gtk-3.0'
    'httpie'
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
    'procs'
    'qt5ct'
    'ranger'
    'rofi'
    'silicon'
    'starship.toml'
    'zsh'
  )
  local -r entry_symbolic=(
    'jquake.desktop'
    'mozc_config.desktop'
    'mozc_dictionary.desktop'
    'mozc_word_register.desktop'
  )

  mkdir --parents "${HOME}/.local/share/applications"
  sudo mkdir /etc/gtk-2.0

  for home in "${home_symbolic[@]}"; do ln --symbolic --force --verbose "${current_dir}/${home}" "${HOME}"; done
  for conf in "${conf_symbolic[@]}"; do ln --symbolic --force --verbose "${current_dir}/.config/${conf}" "${HOME}/.config"; done
  for entry in "${entry_symbolic[@]}"; do ln --symbolic --force --verbose "${current_dir}/.local/share/applications/${entry}" "${HOME}/.local/share/applications"; done

  sudo ln --symbolic --force --verbose "${current_dir}/.gtkrc-2.0" /etc/gtk-2.0/gtkrc
  sudo ln --symbolic --force --verbose "${current_dir}/.config/gtk-3.0/settings.ini" /etc/gtk-3.0
}

services() {
  cp --archive "${current_dir}/.config/systemd/user/ssh-agent.service" "${HOME}/.config/systemd/user"
  cp --archive "${current_dir}/.config/systemd/user/"auto-backup.{service,timer} "${HOME}/.config/systemd/user"

  systemctl --user enable --now ssh-agent.service auto-backup.timer
}

main() {
  setup
  services
  chsh --shell "$(which zsh)"

  unset current_dir
}

main "${@}"
