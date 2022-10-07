#!/usr/bin/env bash

if [ "${#}" -eq 0 ]; then
    exit 1
elif [ "${1}" = "--help" ] || [ "${1}" = "-h" ]; then
    cat << EOF
USAGE:
    ${0} [-e GIT_EMAIL] [-n GIT_NAME]

OPTIONS:
        --help or -h
            help
EOF
    exit 0
fi

paru_install() {
    pkgname="paru-bin"
    git clone https://aur.archlinux.org/${pkgname}.git
    cd ${pkgname}
    makepkg -si --noconfirm --needed
    cd ${HOME}
    rm -rf ${pkgname}
}

aur_install() {
    paru -S --noconfirm --needed \
        google-chrome \
        ghq-bin \
        postman-bin \
        spotify \
        slack-desktop \
        downgrade \
        virtualbox-ext-oracle \
        nvm \
        man-pages-ja \
        ttf-ricty \
        notion-app-enhanced \
        libva-vdpau-driver-chromium \
        lazydocker-bin \
    paru -S --noconfirm --needed informant
}


git_email="${1}"
git_name="${2}"

git_settings() {
    git config --global user.email "${git_email}"
    git config --global user.name "${git_name}"
}

psd_settings() {
    firefox
    google-chrome-stable
    psd
    sed -i "s/^#BROWSERS=()/BROWSERS=(firefox google-chrome)/" ${HOME}/.config/psd/psd.conf
    systemctl --user enable --now psd.service
}

paru_install
# get_de=$(neofetch | grep "DE" | cut -d ":" -f 2 | awk '{print $2}')
# if [ ${get_de} = "Xfce" ]; then
#     paru -S --noconfirm --needed gamin xcursor-dmz
# fi
aur_install
git_settings
psd_settings
