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
    sudo apt install curl
fi

# ソースコードのダウンロード
git clone https://github.com/alacritty/alacritty.git
cd alacritty

# Rustのインストール
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update stable
rustup override set stable

# 依存関係のインストール
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

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
