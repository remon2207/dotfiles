#!/usr/bin/env bash

set -eu

main() {
  local -r script_dir="$(cd "$(dirname "${0}")" && pwd)"
  local -r pkgname='paru-bin'

  git clone "https://aur.archlinux.org/${pkgname}.git"
  cd "${pkgname}"
  makepkg --rmdeps --syncdeps --install --needed
  cd "${HOME}"
  rm --recursive --force "${pkgname}"

  # paru --sync --needed --removemake - < "${script_dir}/pkglist_aur.txt"
  paru --sync --needed --removemake \
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

main "${@}"
