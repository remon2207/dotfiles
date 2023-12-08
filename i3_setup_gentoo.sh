#!/usr/bin/env bash

set -eu

current_dir=$(cd "$(dirname "${0}")" && pwd)
home_symbolic=(
  '.curlrc'
  '.gitconfig'
  '.gtkrc-2.0_gentoo'
  '.profile'
  '.ripgreprc'
  '.tmux_gentoo.conf'
  '.wgetrc'
  '.xinitrc_gentoo'
  '.Xresources_gentoo'
  '.zshrc'
  'bin'
  'commit.template'
)
conf_symbolic=(
  'alacritty'
  'bat'
  'dunst'
  'fcitx5'
  'fontconfig'
  'gh'
  'gtk-3.0_gentoo'
  'htop'
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
  'polybar_gentoo'
  'procs'
  'qt5ct'
  'ranger'
  'rofi'
  'silicon'
  'wezterm'
  'zsh'
)
entry_symbolic=(
  'mozc_config_gentoo.desktop'
  'mozc_dictionary_gentoo.desktop'
)

setup() {
  mkdir --parents "${HOME}/.local/share/applications"
  sudo mkdir /etc/gtk-2.0

  for home in "${home_symbolic[@]}"; do
    home_replaced="$(echo "${home}" | sed --expression='s/^\(.*\)_gentoo\(.*\)$/\1\2/')"
    ln --symbolic --force --verbose "${current_dir}/${home}" "${HOME}/${home_replaced}"
  done
  for conf in "${conf_symbolic[@]}"; do
    conf_replaced="$(echo "${conf}" | sed --expression='s/^\(.*\)_gentoo\(.*\)$/\1\2/')"
    ln --symbolic --force --verbose "${current_dir}/.config/${conf}" "${HOME}/${conf_replaced}"
  done
  for entry in "${entry_symbolic[@]}"; do
    entry_replaced="$(echo "${entry}" | sed --expression='s/^\(.*\)_gentoo\(.*\)$/\1\2/')"
    ln --symbolic --force --verbose "${current_dir}/.local/share/applications/${entry}" "${HOME}/.local/share/applications/${entry_replaced}"
  done

  sudo ln --symbolic --force --verbose "${HOME}/.gtkrc-2.0" /etc/gtk-2.0/gtkrc
  sudo ln --symbolic --force --verbose "${HOME}/.config/gtk-3.0/settings.ini" /etc/gtk-3.0
}

services() {
  cp --archive "${current_dir}/.config/systemd/user/ssh-agent.service" "${HOME}/.config/systemd/user"
  cp --archive "${current_dir}/.config/systemd/user/"auto-backup.{service,timer} "${HOME}/.config/systemd/user"
  sudo cp --archive "${current_dir}/etc/systemd/system/auto-lock@.service" /etc/systemd/system

  systemctl --user enable --now ssh-agent.service auto-backup.timer
  sudo systemctl enable "auto-lock@${USER}.service"
}

main() {
  setup
  services
}

main "${@}"

chsh --shell "$(which zsh)"
