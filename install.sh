#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start setup..."

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -snfv ~/git/dotfiles/"$f" $HOME/
done

# for d_config in alacritty conky bat i3 i3status-rust nvim picom ranger rofi
# do
#     [[ "$d_config" == ".git" ]] && continue
#     [[ "$d_config" == ".DS_Store" ]] && continue

#     ln -snfv ~/git/dotfiles/.config/"$d_config" $HOME/.config/
# done

mkdir ~/.config/nvim
ln -snfv ~/git/dotfiles/.config/nvim/dein.toml ~/.config/nvim/
ln -snfv ~/git/dotfiles/.config/nvim/init.vim ~/.config/nvim/
