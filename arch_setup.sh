#!/usr/bin/env bash

rustup default stable
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
paru -S --skipreview google-chrome ghq-bin postman-bin visual-studio-code-bin spotify ttf-cica
mkdir ${HOME}/.cache/paru/clone/jdim-git
cd $_
paru -G jdim-git
sed -i "s/^source=('git/source=('git+https" PKGBUILD
makepkg -si
