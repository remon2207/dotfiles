#!/usr/bin/env bash

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
        ttf-cica \
        downgrade \
        virtualbox-ext-oracle \
	man-pages-ja
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
}

paru_install
get_de=$(neofetch | grep "DE" | awk -F ':' '{print $2}' | awk -F ' ' '{print $2}')
if [ ${get_de} = "Xfce" ]; then
    paru -S --noconfirm --needed gamin
fi
aur_install
2chproxy
