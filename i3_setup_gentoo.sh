#!/usr/bin/env bash

set -eu

current_dir=$(cd "$(dirname "${0}")" && pwd)
desktop_entry_dir="${current_dir}/.local/share/applications"
home_symbolic=(
  '.curlrc'
  '.gitconfig'
  '.gtkrc-2.0_gentoo'
  '.profile'
  '.tmux_gentoo.conf'
  '.wgetrc'
  '.xinitrc_gentoo'
  '.Xresources_gentoo'
  '.zshrc'
  'commit.template'
  'bin'
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
  'procs'
  'qt5ct'
  'ranger'
  'rofi'
  'silicon'
  'wezterm'
  'zsh'
)

setup() {
  rm --recursive --force "${HOME}/.xinitrc" "${HOME}/.config/i3"
  mkdir --parents "${HOME}/.local/share/applications"
  sudo mkdir /etc/gtk-2.0

  for home in "${home_symbolic[@]}"; do ln --symbolic --force --verbose "${current_dir}/${home}" "${HOME}"; done
  for conf in "${conf_symbolic[@]}"; do ln --symbolic --force --verbose "${current_dir}/.config/${conf}" "${HOME}/.config"; done

  ln --symbolic --force --verbose "${desktop_entry_dir}/mozc_config_gentoo.desktop" "${HOME}/.local/share/applications/mozc_config.desktop"
  ln --symbolic --force --verbose "${desktop_entry_dir}/mozc_dictionary_gentoo.desktop" "${HOME}/.local/share/applications/mozc_dictionary.desktop"

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
