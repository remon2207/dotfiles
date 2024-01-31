#!/usr/bin/env bash

set -eu

setup() {
  local -r script_dir="$(cd "$(dirname "${0}")" && pwd)"

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
    'wezterm'
    'zsh'
  )

  rm --recursive --force "${HOME}/.xinitrc" "${HOME}/.config/i3"
  sudo mkdir /etc/gtk-2.0
  mkdir --parents "${HOME}/.config/systemd/user"

  for home in "${home_symbolic[@]}"; do ln --symbolic --force --verbose "${script_dir}/${home}" "${HOME}"; done
  for conf in "${conf_symbolic[@]}"; do ln --symbolic --force --verbose "${script_dir}/.config/${conf}" "${HOME}/.config"; done
  ln --symbolic --force --verbose "${script_dir}/.local/share/applications" "${HOME}/.local/share"

  sudo ln --symbolic --force --verbose "${script_dir}/.gtkrc-2.0" /etc/gtk-2.0/gtkrc
  sudo ln --symbolic --force --verbose "${script_dir}/.config/gtk-3.0/settings.ini" /etc/gtk-3.0

  cp --archive "${script_dir}/.config/systemd/user/"* "${HOME}/.config/systemd/user"
  sudo cp --archive "${script_dir}/etc/systemd/system/resume@.service" /etc/systemd/system

  systemctl --user enable --now ssh-agent.service auto-backup.timer
  sudo systemctl enable --now "resume@${USER}.service"
}

psd_setup() {
  google-chrome-stable
  psd
  sed --in-place --expression='s/^#\(BROWSERS=\).*$/\1(google-chrome)/' "${HOME}/.config/psd/psd.conf"
  systemctl --user enable --now psd.service
}

main() {
  setup
  psd_setup

  chsh --shell "$(which zsh)"
}

main "${@}"
