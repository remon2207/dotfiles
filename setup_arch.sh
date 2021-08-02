#!/bin/bash

sudo pacman -Syu

# zshがインストールされているか確認
which zsh > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "zshをインストール"
    echo "-----------------------------------"
    sudo pacman -S zsh
fi
# zshをデフォルトシェルにする
zsh_which=$(which zsh)
chsh -s $zsh_which

# curlのインストール確認
which curl > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "curlをインストール"
    echo "-----------------------------------"
    sudo pacman -S curl
fi

# ソースコードのダウンロード
git clone https://github.com/alacritty/alacritty.git ~/alacritty
cd ~/alacritty

# Rustのインストール
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# 依存関係のインストール
sudo pacman -S cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon

# ビルド
cargo build --release

# ビルド後の設定
# Terminfo
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
infocmp alacritty

# デスクトップエントリ
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# マニュアルページ
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null

mkdir -p ${ZDOTDIR:-~}/.zsh_functions
cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty

# powerline-shelインストール
cd ~/
paru -S nerd-fonts-hack
paru -S powerline-go

# lsdがインストールされているか確認
lsd -V > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "lsdをインストール"
    echo "-----------------------------------"
    sudo pacman -S lsd
fi

# batがインストールされているか確認
bat -V > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "lsdをインストール"
    echo "-----------------------------------"
    sudo pacman -S bat
fi

mkdir ~/appimage
cd ~/appimage
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage

pip install pynvim
