#!/bin/bash

sudo pacman -Syu

# zshがインストールされているか確認
zsh --version > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "zsh、curl、wget、lsd、batをインストール"
    echo "-----------------------------------"
    sudo pacman -S zsh
fi

# curlがインストールされているか確認
curl --version > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "zsh、curl、wget、lsd、batをインストール"
    echo "-----------------------------------"
    sudo pacman -S curl
fi

# wgetがインストールされているか確認
wget --version > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "zsh、curl、wget、lsd、batをインストール"
    echo "-----------------------------------"
    sudo pacman -S wget
fi

# lsdがインストールされているか確認
lsd --version > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "zsh、curl、wget、lsd、batをインストール"
    echo "-----------------------------------"
    sudo pacman -S lsd
fi
# batのインストール確認
bat --version > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "curl、wget、lsd、batをインストール"
    echo "-----------------------------------"
    sudo pacman -S bat
fi

# fzfのインストール確認
fzf --version > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "curl、wget、lsd、batをインストール"
    echo "-----------------------------------"
    sudo pacman -S bat
fi

# fdのインストール確認
fd --version > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "curl、wget、lsd、batをインストール"
    echo "-----------------------------------"
    sudo pacman -S bat
fi

# nvmのインストール確認
nvm --version > /dev/null 2>&1
if [ "$?" -eq 0 ] ; then
    echo "インストール済み"
else
    echo "インストールされていない"
    echo "curl、wget、lsd、batをインストール"
    echo "-----------------------------------"
    sudo pacman -S bat
fi

# zshをデフォルトシェルにする
chsh -s $(which zsh)


# ソースコードのダウンロード
cd ~/git
git clone https://github.com/alacritty/alacritty.git
cd alacritty

# Rustupのインストール
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
echo "$HOME/.cargo/bin" >> ~/.zshenv
source ~/.zshenv

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

# paru(AUR)インストール
cd ~/git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# powerline-shelインストール
cd ~/
paru -S nerd-fonts-hack
paru -S powerline-go

echo 'export PATH=$PATH:~/.local/bin' >> ~/.xprofile
source ~/.xprofile

sudo pacman -S python-pip fuse
pip3 install --user wheel pynvim

mkdir ~/appimage
cd ~/appimage
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage

# echo -e "clear lock\nclear control\nkeycode 66 = Control_L\nadd control = Control_L Control_R" > ~/.Xmodmap

# sudo pacman -S xarchiver arc-gtk-theme papirus-icon-theme wmctrl xdotool

# cd ~/git
# git clone https://github.com/calandoa/movescreen.git
# cd movescreen
# sudo cp movescreen.py /usr/local/bin

#conkyインストール
# paru -S conky-lua-nv
# echo -e "[Desktop Entry]\nEncoding=UTF-8\nVersion=0.9.4\nType=Application\nName=conky\nComment=\nExec=conky -d\nStartupNotify=false\nTerminal=false\nHidden=false" > ~/.config/autostart/conky.desktop
