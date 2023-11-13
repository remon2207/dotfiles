#!/usr/bin/env bash

set -eu

echo '======================='
echo 'start!!!'
echo '======================='

paru_install() {
  pkgname='paru-bin'
  git clone "https://aur.archlinux.org/${pkgname}.git"
  cd "${pkgname}"
  makepkg -si --noconfirm --needed
  cd "${HOME}"
  rm -rf "${pkgname}"

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
  sed -i 's/^#BROWSERS=()/BROWSERS=(vivaldi)/' "${HOME}/.config/psd/psd.conf"
  systemctl --user enable --now psd.service
}

main() {
  paru_install
  aur_install
  psd_settings
}

main "${@}"

echo '======================='
echo 'done!!!'
echo '======================='
