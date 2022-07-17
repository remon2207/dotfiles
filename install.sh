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

    ln -snfv ./${f} $HOME/
done

cd ./.config

for conf in ./*
do
  ln -snfv ./config/${conf} $HOME/.config/
done

sudo ln -snfv ./.gtkrc-2.0 /etc/gtk-2.0/gtkrc
sudo ln -snfv ./.config/gtk-3.0/settings.ini /etc/gtk-3.0/settings.ini
