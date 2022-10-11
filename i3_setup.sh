#!/usr/bin/env bash

echo "======================="
echo "start!!!"
echo "======================="

current_dir=$(cd $(dirname $0); pwd)
file_name=$(basename $0)
home_symbolic=(".gtkrc-2.0" ".tmux.conf" ".xinitrc" ".Xresources" ".zprofile" ".zshrc")
conf_symbolic=("alacritty" "bat" "dunst" "fontconfig" "gtk-3.0" "htop" "i3" "neofetch" "nvim" "picom" "polybar" "ranger" "rofi" "silicon" "starship.toml")

repeat() {
    for home in ${home_symbolic[@]}; do
        echo "${current_dir}/${home}"
    done
    for conf in ${conf_symbolic[@]}; do
        echo "${current_dir}/.config/${conf}"
    done
}

repeat

cp ${current_dir}/.config/systemd/user/ssh-agent.service ~/.config/systemd/user/
sudo cp ${current_dir}/etc/systemd/system/auto-lock@.service /etc/systemd/system/auto-lock@${USER}.service

echo "======================="
echo "done!!!"
echo "======================="
