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
  local -r siki_url="$(curl --fail --silent --show-error --location 'https://sikiapp.net' | rg 'AppImage' | awk --field-separator='"' '{print $4}')"
  local -r siki_filename="$(awk --field-separator='/' '{print $4}' <<< "${siki_url}")"

  curl --fail --silent --show-error --location --remote-name "https://sikiapp.net/${siki_url}" | rg 'AppImage' | awk --field-separator='"' '{print $4}'
  chmod +x "${siki_filename}"

  # paru --sync --needed - < "${HOME}/dotfiles/pkglist_aur.txt"
  paru --sync --needed \
    ghq-bin \
    slack-desktop \
    downgrade \
    nvm \
    upd72020x-fw \
    virtualbox-ext-oracle \
    ttf-hackgen \
    xcursor-breeze
}

psd_settings() {
  vivaldi-stable
  psd
  sd '^(BROWSERS=").*(")$' "\$1vivaldi\$2" "${HOME}/.config/psd/psd.conf"
  systemctl --user enable --now psd.service
}

main() {
  sudo timedatectl set-ntp true

  paru_install
  pkg_install
  psd_settings
}

main "${@}"
