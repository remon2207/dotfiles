#!/usr/bin/env bash

echo "======================="
echo "start!!!"
echo "======================="

current_dir=$(cd $(dirname $0); pwd)
file_name=$(basename $0)
home_symbolic=(".gtkrc-2.0" ".tmux.conf" ".xinitrc" ".Xresources" ".zprofile" ".zshrc" ".zsh")
conf_symbolic=("alacritty" "bat" "dunst" "fontconfig" "gtk-3.0" "htop" "i3" "neofetch" "nvim" "picom" "polybar" "ranger" "rofi" "silicon" "starship.toml")

repeat() {
    rm -rf ${HOME}/.xinitrc ${HOME}/.config/i3

    for home in ${home_symbolic[@]}; do
        ln -snfv ${current_dir}/${home} ${HOME}/
    done
    for conf in ${conf_symbolic[@]}; do
        ln -snfv ${current_dir}/.config/${conf} ${HOME}/.config/
    done

    sudo mkdir /etc/gtk-2.0
    sudo ln -s ${HOME}/.gtkrc-2.0 /etc/gtk-2.0/gtkrc
    sudo ln -s ${HOME}/.config/gtk-3.0/settings.ini /etc/gtk-3.0
}

repeat

cp ${current_dir}/.config/systemd/user/ssh-agent.service ${HOME}/.config/systemd/user/
sudo cp ${current_dir}/etc/systemd/system/auto-lock@.service /etc/systemd/system/

systemctl --user enable --now ssh-agent.service
sudo systemctl enable auto-lock@${USER}.service

echo "======================="
echo "done!!!"
echo "======================="
