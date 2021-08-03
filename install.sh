#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start setup..."

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".config" ]] && continue

    ln -snfv ~/dotfiles/"$f" ~/
done

cd .config

for d_config in alacritty nvim conky
do
    [[ "$d_config" == ".git" ]] && continue
    [[ "$d_config" == ".DS_Store" ]] && continue
    [[ "$d_config" == "nvim" ]] && continue

    ln -snfv ~/dotfiles/.config/"$d_config" ~/.config/
done

mkdir ~/.config/nvim
ln -snfv ~/dotfiles/.config/nvim/dein.toml ~/.config/nvim/
ln -snfv ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/
