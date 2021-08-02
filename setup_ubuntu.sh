#!/bin/bash

# curlのインストール確認
which curl > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "-----------------------------------"
    yes | sudo apt update
    yes | sudo apt upgrade
    yes | sudo apt install curl
fi

# ソースコードのダウンロード
git clone https://github.com/alacritty/alacritty.git ~/alacritty
cd ~/alacritty

# Rustのインストール
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# 依存関係のインストール
yes | sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

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

cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty

cd ~/
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# pip3がインストールされているか確認
pip3 -V > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "pip3をインストール"
    echo "-----------------------------------"
    yes | sudo apt update
    yes | sudo apt upgrade
    yes | sudo apt install python3-pip
fi
# powerline-shellをインストール
pip3 install --user powerline-shell

# lsdがインストールされているか確認
lsd -V > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "lsdをインストール"
    echo "-----------------------------------"
    yes | sudo apt update
    yes | sudo apt upgrade
    cargo install lsd
fi

# batがインストールされているか確認
bat -V > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "lsdをインストール"
    echo "-----------------------------------"
    yes | sudo apt update
    yes | sudo apt upgrade
    yes | sudo apt install bat
fi

# zshがインストールされているか確認
which zsh > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "zshをインストール
    echo "-----------------------------------"
    yes | sudo apt update
    yes | sudo apt upgrade
    yes | sudo apt install zsh
fi
# zshをデフォルトシェルにする
zsh_which=$(which zsh)
chsh -s $zsh_which
