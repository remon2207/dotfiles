#!/usr/bin/env bash

paru_install() {
    pacman -Q rustup > /dev/null 2>&1
    if [ ${?} -eq 1 ]; then
        sudo pacman -S --noconfirm rustup
    fi

    rustup default stable
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ${HOME}
    rm -rf paru
}

aur_install() {
    paru -S --noconfirm --skipreview google-chrome ghq-bin postman-bin visual-studio-code-bin spotify ttf-cica
    mkdir ${HOME}/.cache/paru/clone/jdim-git
    cd $_
    paru -G jdim-git
    sed -i "s/^source=('git/source=('git+https" PKGBUILD
    makepkg -si
}

2chproxy() {
    pacman -Q perl-lwp-protocol-https > /dev/null 2>&1
    if [ ${?} -eq 1 ]; then
        sudo pacman -S --noconfirm perl-lwp-protocol-https
    fi

    pacman -Q ghq-bin > /dev/null 2>&1
    if [ ${?} -eq 1 ]; then
        paru -S --noconfirm ghq-bin
    fi

    cd ${HOME}
    ghq get yama-natuki/2chproxy.pl
    mkdir ${HOME}/.local/bin/
    ./ghq/github.com/yama-natuki/2chproxy.pl/install.sh ${HOME}/.local/bin
}

paru_install
aur_install
2chproxy
