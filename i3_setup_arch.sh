#!/usr/bin/env bash

set -eu

current_dir=$(cd "$(dirname "${0}")" && pwd)
home_symbolic=(
  '.curlrc'
  '.gitconfig'
  '.gtkrc-2.0_arch'
  '.profile'
  '.ripgreprc'
  '.tmux_arch.conf'
  '.wgetrc'
  '.xinitrc_arch'
  '.Xresources_arch'
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
  'gtk-3.0_arch'
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
  'polybar_arch'
  'procs'
  'qt5ct'
  'ranger'
  'rofi'
  'silicon'
  'starship.toml'
  'wezterm'
  'zsh'
)
entry_symbolic=(
  'mozc_config_arch.desktop'
  'mozc_dictionary_arch.desktop'
  'mozc_word_register_gentoo.desktop'
)

setup() {
  mkdir --parents "${HOME}/.local/share/applications"
  sudo mkdir /etc/gtk-2.0

  for home in "${home_symbolic[@]}"; do
    home_replaced="$(echo "${home}" | sd '^(.*)_arch(.*)$' "\$1\$2")"
    ln --symbolic --force --verbose "${current_dir}/${home}" "${HOME}/${home_replaced}"
  done
  for conf in "${conf_symbolic[@]}"; do
    conf_replaced="$(echo "${conf}" | sd '^(.*)_arch(.*)$' "\$1\$2")"
    ln --symbolic --force --verbose "${current_dir}/.config/${conf}" "${HOME}/${conf_replaced}"
  done
  for entry in "${entry_symbolic[@]}"; do
    entry_replaced="$(echo "${entry}" | sd '^(.*)_arch(.*)$' "\$1\$2")"
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
