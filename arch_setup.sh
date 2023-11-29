#!/usr/bin/env bash

set -eu

paru_install() {
  local pkgname='paru-bin'
  git clone "https://aur.archlinux.org/${pkgname}.git"
  cd "${pkgname}"
  makepkg -si --needed
  cd "${HOME}"
  rm --recursive --force "${pkgname}"

  unset pkgname
}

aur_install() {
  paru -S --needed - < pkglist_aur
  # paru -S --noconfirm --needed \
  #   ghq-bin \
  #   slack-desktop \
  #   downgrade \
  #   nvm \
  #   efm-langserver \
  #   man-pages-ja \
  #   upd72020x-fw \
  #   virtualbox-ext-oracle \
  #   xcursor-breeze
}

psd_settings() {
  vivaldi-stable
  psd
  sed --in-place --expression='s/^#\(BROWSERS=(\).*/\1vivaldi)/' "${HOME}/.config/psd/psd.conf"
  systemctl --user enable --now psd.service
}

main() {
  paru_install
  aur_install
  psd_settings
}

main "${@}"
