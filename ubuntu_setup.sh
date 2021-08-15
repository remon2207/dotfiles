#!/bin/bash

if [ $# -lt 1 ] ; then
    echo 'Usage:'
    echo 'ubuntu_setup.sh <distribution>'
    exit
fi

# zshがインストールされているか確認
which zsh > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo -e "-------------------------------------------------------------------------\nzsh is already installed\n-------------------------------------------------------------------------"
else
    echo -e "-------------------------------------------------------------------------\nWe don't have zsh installed, so we'll install it.\n-------------------------------------------------------------------------"
    yes | sudo apt update
    yes | sudo apt upgrade
    yes | sudo apt install zsh
fi
# zshをデフォルトシェルにする
echo -e "-------------------------------------------------------------------------\nMake zsh the default shell\n-------------------------------------------------------------------------"
chsh -s $(which zsh)

# curlのインストール確認
which curl > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo -e "-------------------------------------------------------------------------\ncurl is already installed\n-------------------------------------------------------------------------"
else
    echo -e "-------------------------------------------------------------------------\nWe don't have curl installed, so we'll install it.\n-------------------------------------------------------------------------"
    yes | sudo apt update
    yes | sudo apt upgrade
    yes | sudo apt install curl
fi

# ソースコードのダウンロード
echo -e "-------------------------------------------------------------------------\nClone the source alacritty\n-------------------------------------------------------------------------"
git clone https://github.com/alacritty/alacritty.git ~/alacritty
cd ~/alacritty

# Rustのインストール
echo -e "-------------------------------------------------------------------------\nInstalling Rust\n-------------------------------------------------------------------------"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# 依存関係のインストール
echo -e "-------------------------------------------------------------------------\nInstall the build dependencies\n-------------------------------------------------------------------------"
yes | sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

# ビルド
echo -e "-------------------------------------------------------------------------\nBuild with cargo\n-------------------------------------------------------------------------"
cargo build --release

# ビルド後の設定
# Terminfo
echo -e "-------------------------------------------------------------------------\nPost-build configuration\n-------------------------------------------------------------------------"
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

echo -e "-------------------------------------------------------------------------\nInstall the fonts you want to use with powerline.\n-------------------------------------------------------------------------"
cd ~/
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

git clone --branch=master --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh Hack
cd ..
rm -rf nerd-fonts

# pip3がインストールされているか確認
pip3 -V > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo -e "-------------------------------------------------------------------------\npip3 is already installed\n-------------------------------------------------------------------------"
else
    echo -e "-------------------------------------------------------------------------\nWe don't have pip3 installed, so we'll install it.\n-------------------------------------------------------------------------"
    yes | sudo apt update
    yes | sudo apt upgrade
    yes | sudo apt install python3-pip
fi
# powerline-shellをインストール
echo -e "-------------------------------------------------------------------------\nInstalling powerline-shell\n-------------------------------------------------------------------------"
pip3 install --user powerline-shell

# lsdがインストールされているか確認
#lsd -V > /dev/null 2>&1
#if [ "$?" -eq 0 ] ; then
#    echo -e "-------------------------------------------------------------------------\nlsd is already installed\n-------------------------------------------------------------------------"
#else
#    echo -e "-------------------------------------------------------------------------\nWe don't have lsd installed, so we'll install it.\n-------------------------------------------------------------------------"
#    yes | sudo apt update
#    yes | sudo apt upgrade
#    cargo install lsd
#fi

# batがインストールされているか確認
#bat -V > /dev/null 2>&1
#if [ "$?" -eq 0 ] ; then
#    echo -e "-------------------------------------------------------------------------\nbat is already installed\n-------------------------------------------------------------------------"
#else
#    echo -e "-------------------------------------------------------------------------\nWe don't have bat installed, so we'll install it.\n-------------------------------------------------------------------------"
#    yes | sudo apt update
#    yes | sudo apt upgrade
#    yes | sudo apt install bat
#fi
# gdebiがインストールされているか確認
which gdebi > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo -e "-------------------------------------------------------------------------\ngdebi is already installed\n-------------------------------------------------------------------------"
else
    echo -e "-------------------------------------------------------------------------\nWe don't have gdebi installed, so we'll install it.\n-------------------------------------------------------------------------"
    yes | sudo apt update
    yes | sudo apt upgrade
    yes | sudo apt install gdebi
fi

# 第一引数がUbuntuのとき
if [ "Ubuntu" = "$1" ] ; then
    bat -V > /dev/null 2>&1
    if [ "$?" -eq 0 ] ; then
        echo -e "-------------------------------------------------------------------------\nbat is already installed\n-------------------------------------------------------------------------"
    else
        echo -e "-------------------------------------------------------------------------\nInstalling bat\n-------------------------------------------------------------------------"
        curl -Lo ~/Downloads/bat_0.18.2_amd64.deb https://github.com/sharkdp/bat/releases/download/v0.18.2/bat_0.18.2_amd64.deb
        sudo gdebi ~/Downloads/bat_0.18.2_amd64.deb
    fi
# 第一引数がLinux Mintのとき
elif [ "Linux-Mint" = "$1" ] ; then
    bat -V > /dev/null 2>&1
    if [ "$?" -eq 0 ] ; then
        echo -e "-------------------------------------------------------------------------\nbat is already installed\n-------------------------------------------------------------------------"
    else
        echo -e "-------------------------------------------------------------------------\nInstalling bat\n-------------------------------------------------------------------------"
        yes | sudo apt update
        yes | sudo apt upgrade
        yes | sudo apt install bat
    fi
fi

echo -e "-------------------------------------------------------------------------\nDownload Neovim's Appimage\n-------------------------------------------------------------------------"
mkdir ~/appimage
curl -Lo ~/appimage/nvim.appimage https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x ~/appimage/nvim.appimage

pip3 install pynvim
