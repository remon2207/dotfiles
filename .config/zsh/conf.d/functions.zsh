psidkill() {
  PS_ID=$(ps auxf | grep -i $1 | awk '{print $2}' | head -n 1)
  readonly PS_ID

  kill ${ps_id}

  unset PS_ID
}

tochrome() {
  readonly DOTFILES_DIR="${HOME}/ghq/github.com/remon2207/dotfiles"

  sd '(firefox|vivaldi-stable)' 'google-chrome' "${dotfiles_dir}/.config/mimeapps.list"
  sd '(firefox|vivaldi-stable)' 'google-chrome-stable' "${dotfiles_dir}/.config/kitty/conf.d/advanced.conf"
  sd '(firefox|vivaldi-stable)' 'google-chrome-stable' "${dotfiles_dir}/.config/alacritty/conf.d/env.yml"

  unset DOTFILES_DIR
}

tofirefox() {
  readonly DOTFILES_DIR="${HOME}/ghq/github.com/remon2207/dotfiles"

  sd '(google-chrome|vivaldi-stable)' 'firefox' "${dotfiles_dir}/.config/mimeapps.list"
  sd '(google-chrome-stable|vivaldi-stable)' 'firefox' "${dotfiles_dir}/.config/kitty/conf.d/advanced.conf"
  sd '(google-chrome-stable|vivaldi-stable)' 'firefox' "${dotfiles_dir}/.config/alacritty/conf.d/env.yml"

  unset DOTFILES_DIR
}

tovivaldi() {
  readonly DOTFILES_DIR="${HOME}/ghq/github.com/remon2207/dotfiles"

  sd '(firefox|google-chrome)' 'vivaldi-stable' "${dotfiles_dir}/.config/mimeapps.list"
  sd '(firefox|google-chrome-stable)' 'vivaldi-stable' "${dotfiles_dir}/.config/kitty/conf.d/advanced.conf"
  sd '(firefox|google-chrome-stable)' 'vivaldi-stable' "${dotfiles_dir}/.config/alacritty/conf.d/env.yml"

  unset DOTFILES_DIR
}

mkcd() {
  mkdir -p "${1}"
  cd "${1}"
}

cup() {
  checkupdates
  if [[ $? -eq 0 ]]; then
    echo
    read "yn?Do you want to update?(y/n): "
    case "${yn}" in
    [yY])
      paru -Syu
      ;;
    esac

    return 0
  else
    return 1
  fi
}

bootusb() {
  if [[ $# -eq 0 ]] || [[ $# -eq 1 ]]; then
    echo 'sudo dd bs=4M if=<1つ目の引数> of=<2つ目の引数> conv=fsync oflag=direct status=progress'
    return 1
  elif [[ $# -eq 2 ]]; then
    echo "sudo dd bs=4M if=${1} of=${2} conv=fsync oflag=direct status=progress"
    read "yn?実行しますか？(y/n): "
    case "${yn}" in
    [yY]) sudo dd bs=4M "if=${1}" "of=${2}" conv=fsync oflag=direct status=progress ;;
    [nN]) return 1 ;;
    esac
  fi
}

raspi-backup() {
  sudo dd if=/dev/sde conv=sync,noerror iflag=nocache oflag=nocache,dsync | pv | pigz > "${1}"
}

netreload() {
  NIC_NAME=$(ip link | grep '2: ' | awk '{print $2}' | cut -d ':' -f 1)
  readonly NIC_NAME

  sudo nmcli connection down "${NIC_NAME}"
  sudo nmcli connection up "${NIC_NAME}"

  unset NIC_NAME
}

tofish() {
  readonly DOTFILES="${HOME}/ghq/github.com/remon2207/dotfiles"

  STARTLINE=$(($(cat "${HOME}/.zshrc" | rg -n 'load fish' | cut -d ':' -f 1) + 1))
  readonly STARTLINE

  ENDLINE=$(cat "${HOME}/.zshrc" | wc -l)
  readonly ENDLINE

  sed -i "${STARTLINE},"${ENDLINE}"s/^# //" "${DOTFILES}/.zshrc"
  sed -i '2s/^/# /' "${DOTFILES}/.tmux.conf"
  sed -i '3s/^# //' "${DOTFILES}/.tmux.conf"

  unset DOTFILES STARTLINE ENDLINE

  if [[ $? -eq 0 ]]; then
    exit
  fi
}

authycheck() {
  VERSION_NUMBER=$(curl -sL https://api.snapcraft.io/api/v1/snaps/search\?q=authy | jq | rg 'revision' | sed 's/ //g' | awk -F '[":,]' '{print $4}')
  readonly VERSION_NUMBER

  echo "revision: ${VERSION_NUMBER}"

  unset version_number
}
