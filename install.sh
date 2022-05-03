#!/usr/bin/env bash

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start setup..."

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".config" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue

    ln -snfv $HOME/dotfiles/${f} $HOME/
done

for conf in .config/*
do
  ln -snfv $HOME/dotfiles/${conf} $HOME/.config/
done
# sudo ln -snfv $HOME/dotfiles/fonts /usr/share/

sudo ln -snfv $HOME/.gtkrc-2.0 /etc/gtk-2.0/gtkrc
sudo ln -snfv $HOME/.config/gtk-3.0/settings.ini /etc/gtk-3.0/settings.ini
