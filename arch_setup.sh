#!/usr/bin/env bash

set -eu

if [[ $# -eq 0 ]]; then
  exit 1
elif [[ "${1}" == '--help' ]] || [[ "${1}" == '-h' ]]; then
  cat << EOF
USAGE:
    $0 [GIT_EMAIL] [GIT_NAME]

OPTIONS:
        --help or -h
            help
EOF
  exit 0
fi

echo '======================='
echo 'start!!!'
echo '======================='

git_email="${1}"
git_name="${2}"
base_dir=$(dirname "${0}")

paru_install() {
  pkgname='paru-bin'
  git clone "https://aur.archlinux.org/${pkgname}.git"
  cd "${pkgname}"
  makepkg -si --noconfirm --needed
  cd "${HOME}"
  rm -rf "${pkgname}"
}

aur_install() {
  paru -S --noconfirm --needed - < pkglist_aur
  # paru -S --noconfirm --needed \
  #   google-chrome \
  #   ghq-bin \
  #   slack-desktop \
  #   downgrade \
  #   ttf-hackgen \
  #   ttf-cica \
  #   nvm \
  #   libva-vdpau-driver-chromium \
  #   lazydocker-bin
}

fish_plugin() {
  fisher install < "${base_dir}/.config/fish/fish_plugins"
}

git_settings() {
  git config --global user.name "${git_name}"
  git config --global user.email "${git_email}"
}

psd_settings() {
  psd p
  sed -i 's/^#BROWSERS=\(\)/BROWSERS=\(vivaldi\)/' "${HOME}/.config/psd/psd.conf"
  systemctl --user enable --now psd.service
}

main() {
  paru_install
  aur_install
  git_settings
  # fish_plugin
  psd_settings
}

main "$@"

echo '======================='
echo 'done!!!'
echo '======================='
