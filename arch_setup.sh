#!/usr/bin/env bash

set -eu

paru_install() {
  local -r pkgname='paru-bin'
  git clone "https://aur.archlinux.org/${pkgname}.git"
  cd "${pkgname}"
  makepkg --rmdeps --syncdeps --install --needed
  cd "${HOME}"
  rm --recursive --force "${pkgname}"
}

pkg_install() {
  # paru --sync --needed - < "${HOME}/dotfiles/pkglist_aur.txt"
  paru --sync --needed \
    ghq-bin \
    slack-desktop \
    downgrade \
    nvm \
    upd72020x-fw \
    virtualbox-ext-oracle \
    google-chrome \
    authy \
    ttf-hackgen \
    xcursor-breeze
}

psd_settings() {
  google-chrome-stable
  psd
  sed --in-place --expression='s/^#\(BROWSERS=\).*$/\1(google-chrome)/' "${HOME}/.config/psd/psd.conf"
  systemctl --user enable --now psd.service
}

main() {
  paru_install
  pkg_install
  psd_settings
}

main "${@}"
