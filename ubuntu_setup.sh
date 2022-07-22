#!/usr/bin/env bash

sudo apt install -y \
git \
curl \
zsh \
gdebi \
gh

# neovim_dlname=$(curl -L https://github.com/neovim/neovim/releases/latest/ | \
#     grep nvim-linux64.deb | \
#     awk -F 'a href=' '{print $2 $2}' | \
#     grep '^' | \
#     awk -F '"' '{print $2 $1}' | \
#     grep -m 1 "/")
# 
# curl -OL https://github.com${neovim_dlname}
# yes | sudo gdebi nvim-linux64.deb

ghq_dlname=$(curl -L https://github.com/x-motemen/ghq/releases/latest | \
    grep -E "ghq_linux_amd64.zip" | \
    awk -F 'a href="' '{print $2}' | \
    awk -F '"' '{print $1}' | \
    head -n 1)

curl -OL https://github.com${ghq_dlname}

unzip ghq_linux_amd64.zip
sudo cp ghq_linux_amd64/ghq /usr/local/bin/

curl -OL "https://discord.com/api/download?platform=linux&format=deb"
yes | sudo gdebi discord-*.deb

curl -o code.deb -L "https://go.microsoft.com/fwlink/?LinkID=760868"
sudo gdebi code.deb

rm -rf *.{deb,zip}

LC_ALL=C xdg-user-dirs-update --force

for dir in デスクトップ ダウンロード テンプレート 公開 ドキュメント ピクチャ ミュージック ビデオ
do
    rm -rf ${HOME}/${dir}
done

# zshをデフォルトシェルにする
chsh -s $(which zsh)

echo ""
echo "==================================="
echo "Completed!"
echo "==================================="
echo ""
