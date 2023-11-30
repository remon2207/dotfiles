#!/usr/bin/env bash

set -eu

current_dir=$(cd "$(dirname "${0}")" && pwd)
desktop_entry_dir="${current_dir}/.local/share/applications"
home_symbolic=(
  '.curlrc'
  '.gitconfig'
  '.gtkrc-2.0_gentoo'
  '.profile'
  '.tmux.conf_gentoo'
  '.wgetrc'
  '.xinitrc_gentoo'
  '.Xresources_gentoo'
  '.zshrc'
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
  'i3'
  'kitty'
  'Kvantum'
  'lazygit'
  'mimeapps.list'
  'neofetch'
  'nvim'
  'picom'
  'polybar_gentoo'
  'qt5ct'
  'ranger'
  'rofi'
  'silicon'
  'wezterm'
  'zsh'
)
desktop_entry=(
  'bghtop.desktop'
  'mozc.desktop'
  'polybar_restart.desktop'
  'killstartup.desktop'
)

setup() {
  rm --recursive --force "${HOME}/.xinitrc" "${HOME}/.config/i3"
  mkdir --parents "${HOME}/.local/share/applications"
  sudo mkdir /etc/gtk-2.0

  for home in "${home_symbolic[@]}"; do ln --symbolic --force --verbose "${current_dir}/${home}" "${HOME}"; done
  for conf in "${conf_symbolic[@]}"; do ln --symbolic --force --verbose "${current_dir}/.config/${conf}" "${HOME}/.config"; done
  for entry in "${desktop_entry[@]}"; do ln --symbolic --force --verbose "${desktop_entry_dir}/${entry}" "${HOME}/.local/share/applications"; done

  sudo ln --symbolic --force --verbose "${HOME}/.gtkrc-2.0" /etc/gtk-2.0/gtkrc
  sudo ln --symbolic --force --verbose "${HOME}/.config/gtk-3.0/settings.ini" /etc/gtk-3.0
}

services() {
  cp --archive "${current_dir}/.config/systemd/user/ssh-agent.service" "${HOME}/.config/systemd/user"
  cp --archive "${current_dir}/.config/systemd/user/auto-backup.{service,timer}" "${HOME}/.config/systemd/user"
  sudo cp --archive "${current_dir}/etc/systemd/system/auto-lock@.service" /etc/systemd/system

  systemctl --user enable --now ssh-agent.service
  sudo systemctl enable "auto-lock@${USER}.service"
}

main() {
  setup
  services
}

main "${@}"

chsh --shell "$(which zsh)"
