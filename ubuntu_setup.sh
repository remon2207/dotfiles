#!/usr/bin/env bash

sudo apt install -y \
git \
curl \
zsh \
gdebi \
gh

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

cat /etc/os-release | grep "^NAME" | awk -F '"' '{print $2}'

source "$HOME/.cargo/env"

neovim_dlname=$(curl -L https://github.com/neovim/neovim/releases/latest/ | \
    grep nvim-linux64.deb | \
    awk -F 'a href=' '{print $2 $2}' | \
    grep '^' | \
    awk -F '"' '{print $2 $1}' | \
    grep -m 1 "/")

curl -OL https://github.com${neovim_dlname}
yes | sudo gdebi nvim-linux64.deb

lsd_dlname=$(curl -L https://github.com/Peltoche/lsd/releases/latest | \
    grep -E "lsd_*.**amd64.deb" | \
    awk -F 'a href="' '{print $2}' | \
    awk -F '"' '{print $1}' | \
    sort -r | \
    head -n 1)

curl -OL https:/github.com${lsd_dlname}
yes | sudo gdebi lsd_*.**amd64.deb

bat_dlname=$(curl -L https://github.com/Sharkdp/bat/releases/latest | \
    grep -E "bat_*.**amd64.deb" | \
    awk -F 'a href="' '{print $2}' | \
    awk -F '"' '{print $1}' | \
    sort -r | \
    head -n 1)

curl -OL https:/github.com${bat_dlname}
yes | sudo gdebi bat_*.**amd64.deb

tldr_dlname=$(curl -L https://github.com/dbrgn/tealdeer/releases/latest | \
    grep -E "tealdeer-linux-x86_64-musl" | \
    awk -F 'a href="' '{print $2}' | \
    awk -F '"' '{print $1}' | \
    head -n 1)

curl -OL https:/github.com${tldr_dlname}

ghq_dlname=$(curl -L https://github.com/x-motemen/ghq/releases/latest | \
    grep -E "ghq_linux_amd64.zip" | \
    awk -F 'a href="' '{print $2}' | \
    awk -F '"' '{print $1}' | \
    head -n 1)

curl -OL https:/github.com${ghq_dlname}

unzip ghq_linux_amd64.zip

rm -rf *.{deb,zip}

# zshをデフォルトシェルにする
chsh -s $(which zsh)

LC_ALL=C xdg-user-dirs-update --force

# rm -rf $HOME/デスクトップ \
# $HOME/ダウンロード \
# $HOME/テンプレート \
# $HOME/公開 \
# $HOME/ドキュメント \
# $HOME/音楽 \
# $HOME/画像 \
# $HOME/ビデオ \
# $HOME

for dir in デスクトップ ダウンロード テンプレート 公開 ドキュメント 音楽 ピクチャ ミュージック ビデオ
do
    rm -rf ${dir}
done
