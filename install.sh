#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start setup..."

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".config" ]] && continue

    ln -snfv ~/git/dotfiles/"$f" ~/
done

cd .config

for d_config in alacritty nvim conky bat
do
    [[ "$d_config" == ".git" ]] && continue
    [[ "$d_config" == ".DS_Store" ]] && continue
    [[ "$d_config" == "nvim" ]] && continue

    ln -snfv ~/git/dotfiles/.config/"$d_config" ~/.config/
done

mkdir ~/.config/nvim
ln -snfv ~/git/dotfiles/.config/nvim/dein.toml ~/.config/nvim/
ln -snfv ~/git/dotfiles/.config/nvim/init.vim ~/.config/nvim/
