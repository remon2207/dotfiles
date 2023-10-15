#!/usr/bin/env bash

echo "======================="
echo "start!!!"
echo "======================="

current_dir=$(
  cd $(dirname $0)
  pwd
)
file_name=$(basename $0)
# home_symbolic=(
#   ".bash_profile"
#   ".bashrc"
#   ".gtkrc-2.0"
#   ".imwheelrc"
#   ".tmux.conf"
#   ".xinitrc"
#   ".Xmodmap"
#   ".Xresources"
#   ".zprofile"
#   ".zshrc"
#   "commit.template"
# )
home_symbolic=(
  ".bash_profile"
  ".bashrc"
  ".gtkrc-2.0"
  ".profile"
  ".tmux.conf"
  ".xinitrc"
  ".Xresources"
  ".zshrc"
  "commit.template"
)
# conf_symbolic=(
#   "alacritty"
#   "bat"
#   "dunst"
#   "fish"
#   "fontconfig"
#   "gtk-3.0"
#   "htop"
#   "i3"
#   "kitty"
#   "Kvantum"
#   "lazygit"
#   "mpd"
#   "nano"
#   "ncmpcpp"
#   "neofetch"
#   "nvim"
#   "picom"
#   "polybar"
#   "qt5ct"
#   "qutebrowser"
#   "ranger"
#   "rofi"
#   "silicon"
#   "starship.toml"
#   "stylua"
#   "terminator"
#   "wezterm"
#   "zsh"
# )
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
  "lazygit"
  "mpd"
  "nano"
  "ncmpcpp"
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
  "terminator"
  "wezterm"
  "zsh"
)
# desktop_entry=(
#   "bghtop.desktop"
#   "lazydocker.desktop"
#   "mozc.desktop"
# )
desktop_entry=(
  "bghtop.desktop"
  "mozc.desktop"
)
desktop_entry_dir="$current_dir/.local/share/applications"

setup() {
  rm -rf $HOME/.xinitrc $HOME/.config/i3

  for home in ${home_symbolic[@]}; do
    ln -snfv $current_dir/$home $HOME/
  done
  for conf in ${conf_symbolic[@]}; do
    ln -snfv $current_dir/.config/$conf $HOME/.config/
  done
  for entry in ${desktop_entry[@]}; do
    ln -snfv $desktop_entry_dir/$entry $HOME/.local/share/applications/
  done

  sudo mkdir /etc/gtk-2.0

  sudo ln -s $HOME/.gtkrc-2.0 /etc/gtk-2.0/gtkrc
  sudo ln -s $HOME/.config/gtk-3.0/settings.ini /etc/gtk-3.0
  sudo ln -snfv $current_dir/opt/display_nouveau_setup.sh /opt/
  sudo ln -snfv $current_dir/opt/backup.sh /opt/

  ln -s $current_dir/.local/share/applications/lazydocker.desktop $HOME/.local/share/applications/
  ln -s $current_dir/.local/share/applications/bghtop.desktop $HOME/.local/share/applications/
  ln -s $current_dir/.local/share/applications/mozc.desktop $HOME/.local/share/applications/

  git config --global commit.template $HOME/commit.template
}

services() {
  cp $current_dir/.config/systemd/user/ssh-agent.service $HOME/.config/systemd/user/
  cp $current_dir/.config/systemd/user/auto-backup.{service,timer} $HOME/.config/systemd/user/
  sudo cp $current_dir/etc/systemd/system/auto-lock@.service /etc/systemd/system/

  systemctl --user enable --now ssh-agent.service
  sudo systemctl enable auto-lock@${USER}.service
}

setup
services

chsh -s $(which zsh)

echo "======================="
echo "done!!!"
echo "======================="
