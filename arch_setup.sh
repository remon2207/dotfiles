#!/usr/bin/env bash

echo "======================="
echo "start!!!"
echo "======================="

git_email="${1}"
git_name="${2}"

if [ "${#}" -eq 0 ]; then
    exit 1
elif [ "${1}" = "--help" ] || [ "${1}" = "-h" ]; then
    cat << EOF
USAGE:
    ${0} [GIT_EMAIL] [GIT_NAME]

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
        spotify \
        slack-desktop \
        downgrade \
        ttf-cica \
        nvm \
        notion-app-enhanced \
        libva-vdpau-driver-chromium \
        lazydocker-bin
}

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

echo "======================="
echo "done!!!"
echo "======================="
