#!/usr/bin/env bash

echo "======================="
echo "start!!!"
echo "======================="

current_dir=$(
  cd $(dirname $0)
  pwd
)
file_name=$(basename $0)
home_symbolic=(
  ".gtkrc-2.0"
  ".tmux.conf"
  ".xinitrc"
  ".Xresources"
  ".zprofile"
  ".zshrc"
  ".zsh"
  "commit.template"
  ".bashrc"
  ".bash_profile"
  ".Xmodmap"
  ".imwheelrc"
)
conf_symbolic=(
  "alacritty"
  "bat"
  "dunst"
  "fish"
  "fontconfig"
  "gtk-3.0"
  "htop"
  "i3"
  "kitty"
  "Kvantum"
  "neofetch"
  "nvim"
  "picom"
  "polybar"
  "qt5ct"
  "qutebrowser"
  "ranger"
  "rofi"
  "silicon"
  "starship.toml"
  "stylua"
  "terminator"
  "wezterm"
)

repeat() {
  rm -rf $HOME/.xinitrc $HOME/.config/i3

  for home in ${home_symbolic[@]}; do
    ln -snfv $current_dir/$home $HOME/
  done
  for conf in ${conf_symbolic[@]}; do
    ln -snfv $current_dir/.config/$conf $HOME/.config/
  done

  sudo mkdir /etc/gtk-2.0
  sudo ln -s $HOME/.gtkrc-2.0 /etc/gtk-2.0/gtkrc
  sudo ln -s $HOME/.config/gtk-3.0/settings.ini /etc/gtk-3.0
  ln -s $current_dir/.local/share/applications/lazydocker.desktop ~/.local/share/applications/
  ln -s $current_dir/.local/share/applications/bghtop.desktop ~/.local/share/applications/
}

services() {
  cp $current_dir/.config/systemd/user/ssh-agent.service $HOME/.config/systemd/user/
  sudo cp $current_dir/etc/systemd/system/auto-lock@.service /etc/systemd/system/

  systemctl --user enable --now ssh-agent.service
  sudo systemctl enable auto-lock@${USER}.service
}

repeat
services

git config --global commit.template $HOME/commit.template
chsh -s $(which zsh)

echo "======================="
echo "done!!!"
echo "======================="
