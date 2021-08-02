#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start setup..."

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".config" ]] && continue

    ln -snfv $HOME/dotfiles/"$f" $HOME/
done

cd .config

for d_config in alacritty nvim
do
    [[ "$d_config" == ".git" ]] && continue
    [[ "$d_config" == ".DS_Store" ]] && continue

    ln -snfv $HOME/dotfiles/.config/"$d_config" $HOME/.config/
done
