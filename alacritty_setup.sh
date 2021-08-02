#!/bin/bash

# curlのインストール確認
echo "curlがインストールされているか確認"
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
echo "alacrittyをダウンロード"
git clone https://github.com/alacritty/alacritty.git ~/alacritty
cd ~/alacritty

# Rustのインストール
echo "Rustのインストール"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# 依存関係のインストール
echo "依存関係のインストール"
yes | sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

# ビルド
echo "alacrittyのビルド"
cargo build --release

# ビルド後の設定
# Terminfo
echo "Terminfoの設定"
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
infocmp alacritty

# デスクトップエントリ
echo "デスクトップエントリの作成"
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# マニュアルページ
echo "マニュアルページの設定"
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
