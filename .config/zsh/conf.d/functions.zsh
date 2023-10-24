psidkill() {
  ps_id=$(ps auxf | grep -i $1 | awk '{print $2}' | head -n 1)
  kill $ps_id
}

tochrome() {
  dotfiles_dir="$HOME/ghq/github.com/remon2207/dotfiles"

  # /usr/bin/sed -i 's/export BROWSER="\(firefox\|vivaldi-stable\)"/export BROWSER="google-chrome-stable"/' $dotfiles_dir/.profile
  /usr/bin/sed -i 's/\(firefox\|vivaldi-stable\)/google-chrome/' $dotfiles_dir/.config/mimeapps.list
  /usr/bin/sed -i 's/\(firefox\|vivaldi-stable\)/google-chrome-stable/' $dotfiles_dir/.config/kitty/conf.d/advanced.conf
  /usr/bin/sed -i 's/\(firefox\|vivaldi-stable\)/google-chrome-stable/' $dotfiles_dir/.config/alacritty/conf.d/env.yml
}

tofirefox() {
  dotfiles_dir="$HOME/ghq/github.com/remon2207/dotfiles"

  # /usr/bin/sed -i 's/export BROWSER="google-chrome-stable"/export BROWSER="firefox"/' $dotfiles_dir/.profile
  /usr/bin/sed -i 's/google-chrome/firefox/' $dotfiles_dir/.config/mimeapps.list
  /usr/bin/sed -i 's/google-chrome-stable/firefox/' $dotfiles_dir/.config/kitty/conf.d/advanced.conf
  /usr/bin/sed -i 's/\(google-chrome-stable\|vivaldi-stable\)/firefox/' $dotfiles_dir/.config/alacritty/conf.d/env.yml
}

tovivaldi() {
  dotfiles_dir="$HOME/ghq/github.com/remon2207/dotfiles"

  # /usr/bin/sed -i 's/export BROWSER="\(google-chrome-stable\|firefox\)"/export BROWSER="vivaldi-stable"/' $dotfiles_dir/.profile
  /usr/bin/sed -i 's/\(google-chrome\|firefox\)/vivaldi-stable/' $dotfiles_dir/.config/mimeapps.list
  /usr/bin/sed -i 's/\(google-chrome-stable\|firefox\)/vivaldi-stable/' $dotfiles_dir/.config/kitty/conf.d/advanced.conf
  /usr/bin/sed -i 's/\(firefox\|google-chrome-stable\)/vivaldi-stable/' $dotfiles_dir/.config/alacritty/conf.d/env.yml
}

nobuildtemp() {
  sudo /usr/bin/sed -i 's/^BUILDDIR=\/tmp\/makepkg/#BUILDDIR=\/tmp\/makepkg/' /etc/makepkg.conf
}

buildtemp() {
  sudo /usr/bin/sed -i 's/^#BUILDDIR=\/tmp\/makepkg/BUILDDIR=\/tmp\/makepkg/' /etc/makepkg.conf
}

psidc() {
  ps_id=$(ps auxf | grep -i $1 | awk '{print $2}' | head -n 1)
  echo $ps_id
  echo $ps_id | xclip
}

wmclass() {
  xprop WM_CLASS | awk -F '"' '{print $4}'
}

mkcd() {
  mkdir -p $1 && cd $1
}

cup() {
  checkupdates
  if [ $? -eq 0 ]; then
    echo
    read "yn?Do you want to update?(y/n): "
    case "$yn" in
    [yY]) paru -Syu ;;
    esac

    return 0
  else
    return 1
  fi
}

# toi3() {
#   sudo systemctl stop gdm.service
#   sudo systemctl disable gdm.service
#   sudo systemctl stop NetworkManager.service
#   sudo systemctl disable NetworkManager.service
#   sudo systemctl start systemd-networkd.service systemd-resolved.service
#   sudo systemctl enable systemd-networkd.service systemd-resolved.service
# }

bootusb() {
  if [ $# -eq 0 ] || [ $# -eq 1 ]; then
    echo 'sudo dd bs=4M if=<1つ目の引数> of=<2つ目の引数> conv=fsync oflag=direct status=progress'
    return 1
  elif [ $# -eq 2 ]; then
    echo "sudo dd bs=4M if=$1 of=$2 conv=fsync oflag=direct status=progress"
    read "yn?実行しますか？(y/n): "
    case "$yn" in
    [yY]) sudo dd bs=4M if=$1 of=$2 conv=fsync oflag=direct status=progress ;;
    [nN]) return 1 ;;
    esac
  fi
}

raspi-backup() {
  sudo dd if=/dev/sde conv=sync,noerror iflag=nocache oflag=nocache,dsync | pv | pigz > $1
}

netreload() {
  nic_name=$(ip link | grep '2: ' | awk '{print $2}' | cut -d ':' -f 1)
  sudo nmcli connection down $nic_name
  sudo nmcli connection up $nic_name
}

tofish() {
  dotfiles="$HOME/ghq/github.com/remon2207/dotfiles"
  startline=$(($(cat $HOME/.zshrc | rg -n 'load fish' | cut -d ':' -f 1) + 1))
  endline=$(cat $HOME/.zshrc | wc -l)

  sed -i "$startline,"$endline"s/^# //" $dotfiles/.zshrc
  sed -i '2s/^/# /' $dotfiles/.tmux.conf
  sed -i '3s/^# //' $dotfiles/.tmux.conf

  if [[ $? -eq 0 ]]; then
    exit
  fi
}
