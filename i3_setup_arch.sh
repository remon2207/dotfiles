#!/usr/bin/env bash

set -eu

current_dir=$(
  cd "$(dirname "${0}")"
  pwd
)
home_symbolic=(
  '.gtkrc-2.0_arch'
  '.profile'
  '.tmux.conf_arch'
  '.xinitrc_arch'
  '.Xresources_arch'
  '.zshrc'
  '.wgetrc'
  'commit.template'
)
conf_symbolic=(
  'alacritty'
  'bat'
  'dunst'
  'fontconfig'
  'gtk-3.0_arch'
  'htop'
  'i3'
  'kitty'
  'Kvantum'
  'lazygit'
  'neofetch'
  'nvim'
  'picom'
  'polybar_arch'
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
)
desktop_entry_dir="${current_dir}/.local/share/applications"

setup() {
  rm -rf "${HOME}/.xinitrc" "${HOME}/.config/i3"

  for home in "${home_symbolic[@]}"; do
    ln -sfv "${current_dir}/${home}" "${HOME}"
  done
  for conf in "${conf_symbolic[@]}"; do
    ln -sfv "${current_dir}/.config/${conf}" "${HOME}/.config"
  done
  for entry in "${desktop_entry[@]}"; do
    ln -sfv "${desktop_entry_dir}/${entry}" "${HOME}/.local/share/applications"
  done

  sudo mkdir /etc/gtk-2.0

  sudo ln -sfv "${HOME}/.gtkrc-2.0" /etc/gtk-2.0/gtkrc
  sudo ln -sfv "${HOME}/.config/gtk-3.0/settings.ini" /etc/gtk-3.0

  ln -sfv "${current_dir}/.local/share/applications/bghtop.desktop" "${HOME}/.local/share/applications"
  ln -sfv "${current_dir}/.local/share/applications/mozc.desktop" "${HOME}/.local/share/applications"

  git config --global commit.template "${HOME}/commit.template"
}

services() {
  cp -a "${current_dir}/.config/systemd/user/ssh-agent.service" "${HOME}/.config/systemd/user"
  cp -a "${current_dir}/.config/systemd/user/auto-backup.{service,timer}" "${HOME}/.config/systemd/user"
  sudo cp -a "${current_dir}/etc/systemd/system/auto-lock@.service" /etc/systemd/system

  systemctl --user enable --now ssh-agent.service
  sudo systemctl enable "auto-lock@${USER}.service"
}

main() {
  setup
  services
}

main "${@}"

chsh -s "$(which zsh)"
