#!/usr/bin/env bash

paru_install() {
    rustup default stable
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
}

aur_install() {
    paru -S --skipreview google-chrome ghq-bin postman-bin visual-studio-code-bin spotify ttf-cica
    mkdir ${HOME}/.cache/paru/clone/jdim-git
    cd $_
    paru -G jdim-git
    sed -i "s/^source=('git/source=('git+https" PKGBUILD
    makepkg -si
}

2chproxy() {
    cd ${HOME}
    ghq get yama-natuki/2chproxy.pl
    mkdir ${HOME}/.local/bin/
    ./ghq/github.com/yama-natuki/2chproxy.pl/install.sh ${HOME}/.local/bin
}

paru_install
aur_install
2chproxy
