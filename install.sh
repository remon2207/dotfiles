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

for d_config in alacritty nvim
do
    [[ "$d_config" == ".git" ]] && continue
    [[ "$d_config" == ".DS_Store" ]] && continue

    ln -snfv ~/dotfiles/.config/"$d_config" ~/.config/
done

for nvim in dein.toml init.vim
do
    [[ "$d_config" == ".git" ]] && continue
    [[ "$d_config" == ".DS_Store" ]] && continue
    [[ "$d_config" == "dein" ]] && continue

    ln -snfv ~/dotfiles/.config/"$nvim" ~/.config/nvim/
done
