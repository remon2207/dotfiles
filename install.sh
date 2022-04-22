#!/usr/bin/env bash -x

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start setup..."

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".config" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue

    ln -snfv ~/dotfiles/"$f" $HOME/
done
ln -snfv ~/dotfiles/.config/* $HOME/.config/
sudo cp -rf fonts /usr/share/
