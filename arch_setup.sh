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
        visual-studio-code-bin \
        spotify \
        downgrade \
        virtualbox-ext-oracle \
        nvm \
        man-pages-ja \
        ttf-cica \
        xcursor-dmz
    mkdir -p ${HOME}/.cache/paru/clone/
    cd $_
    paru -G jdim-git
    cd $_
    sed -i "s/^source=('git/source=('git+https/" PKGBUILD
    makepkg -si --noconfirm --needed
}

2chproxy() {
    pacman -Q perl-lwp-protocol-https > /dev/null 2>&1
    if [ ${?} -eq 1 ]; then
        sudo pacman -S --noconfirm --needed perl-lwp-protocol-https
    fi

    pacman -Q ghq-bin > /dev/null 2>&1
    if [ ${?} -eq 1 ]; then
        paru -S --noconfirm --needed ghq-bin
    fi

    cd ${HOME}
    ghq get yama-natuki/2chproxy.pl
    mkdir -p ${HOME}/.local/bin/
    jdim
    ./ghq/github.com/yama-natuki/2chproxy.pl/install.sh ${HOME}/.local/bin
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
get_de=$(neofetch | grep "DE" | cut -d ":" -f 2 | awk '{print $2}')
if [ ${get_de} = "Xfce" ]; then
    paru -S --noconfirm --needed gamin
fi
aur_install
2chproxy
git_settings
psd_settings
