#!/usr/bin/env bash

THIS_DIR=$(cd $(dirname $0); pwd)

echo "start setup..."

for f in ${THIS_DIR}/.??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".config" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue

    ln -snfv ${f} $HOME/
done

for conf in ${THIS_DIR}/.config/*
do
  ln -snfv ${conf} $HOME/.config/
done

sudo ln -snfv ${THIS_DIR}/.gtkrc-2.0 /etc/gtk-2.0/gtkrc
sudo ln -snfv ${THIS_DIR}/.config/gtk-3.0/settings.ini /etc/gtk-3.0/settings.ini

echo "end setup"
