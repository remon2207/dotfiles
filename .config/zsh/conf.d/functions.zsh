psidkill() {
  ps_id=$(ps auxf | grep -i $1 | awk '{print $2}' | head -n 1)

  kill ${ps_id}

  unset ps_id
}

changebrowser() {
  usage() {
    cat << EOF
USAGE:
  changebrowser <OPTIONS>
OPTIONS:
  -c    Current browser
  -n    New browser
EOF
  }

  if [[ ${#} -ne 4 ]] || [[ "${1}" == '-h' ]] || [[ "${1}" == '--help' ]]; then
    usage
    return 1
  fi

  dotfiles="${HOME}/ghq/github.com/remon2207/dotfiles"
  mimeapps="${dotfiles}/.config/mimeapps.list"
  kitty_conf="${dotfiles}/.config/kitty/conf.d/advanced.conf"
  alacritty_conf="${dotfiles}/.config/alacritty/conf.d/env.yml"

  replacements() {
    sd -s "${1}" "${3}" "${mimeapps}"
    sd -s "${2}" "${4}" "${kitty_conf}"
    sd -s "${2}" "${4}" "${alacritty_conf}"
  }

  while getopts 'c:n:' OPT; do
    case "${OPT}" in
    'c')
      current="${OPTARG}"
      ;;
    'n')
      new="${OPTARG}"
      ;;
    esac
  done

  if [[ "${current}" == 'vivaldi' ]] && [[ "${new}" == 'chrome' ]]; then
    replacements vivaldi-stable vivaldi-stable google-chrome google-chrome-stable
  elif [[ "${current}" == 'vivaldi' ]] && [[ "${new}" == 'firefox' ]]; then
    replacements vivaldi-stable vivaldi-stable firefox firefox
  elif [[ "${current}" == 'chrome' ]] && [[ "${new}" == 'vivaldi' ]]; then
    replacements google-chrome google-chrome-stable vivaldi-stable vivaldi-stable
  elif [[ "${current}" == 'chrome' ]] && [[ "${new}" == 'firefox' ]]; then
    replacements google-chrome google-chrome-stable firefox firefox
  elif [[ "${current}" == 'firefox' ]] && [[ "${new}" == 'vivaldi' ]]; then
    replacements firefox firefox vivaldi-stable vivaldi-stable
  elif [[ "${current}" == 'firefox' ]] && [[ "${new}" == 'chrome' ]]; then
    replacements firefox firefox google-chrome google-chrome-stable
  fi

  unset dotfiles mimeapps kitty_conf alacritty_conf OPT OPTARG current new
}

changeterm() {
  usage() {
    cat << EOF
USAGE:
  changeterm <OPTIONS>
OPTIONS:
  -c    Current terminal
  -n    new terminal
EOF
  }

  if [[ ${#} -ne 4 ]] || [[ "${1}" == '-h' ]] || [[ "${1}" == '--help' ]]; then
    usage
    return 1
  fi

  dotfiles="${HOME}/ghq/github.com/remon2207/dotfiles"
  i3_conf="${dotfiles}/.config/i3/conf.d/appstart_keybind.conf"
  bghtop="${dotfiles}/.local/share/applications/bghtop.desktop"
  alacritty='bindsym $mod+Return exec --no-startup-id alacritty'
  alacritty_ranger='bindsym $mod+e exec --no-startup-id alacritty -e ranger'
  kitty='bindsym $mod+Return exec --no-startup-id kitty'
  kitty_ranger='bindsym $mod+e exec --no-startup-id kitty -1 ranger'
  wezterm='bindsym $mod+Return exec --no-startup-id wezterm'
  wezterm_ranger='bindsym $mod+e exec --no-startup-id wezterm -e ranger'

  replacements() {
    sd "^${1}" "# ${1}" "${i3_conf}"
    sd "^${2}" "# ${2}" "${i3_conf}"

    sd "^# ${3}" "${3}" "${i3_conf}"
    sd "^# ${4}" "${4}" "${i3_conf}"

    sd "^Exec=${5}" "# Exec=${5}" "${bghtop}"
    sd "^# Exec=${6}" "Exec=${6}" "${bghtop}"
  }

  while getopts 'c:n:' OPT; do
    case "${OPT}" in
    'c')
      current="${OPTARG}"
      ;;
    'n')
      new="${OPTARG}"
      ;;
    esac
  done

  if [[ "${current}" == 'alacritty' ]] && [[ "${new}" == 'kitty' ]]; then
    replacements ${alacritty} ${alacritty_ranger} ${kitty} ${kitty_ranger} ${current} ${new}
  elif [[ "${current}" == 'alacritty' ]] && [[ "${new}" == 'wezterm' ]]; then
    replacements ${alacritty} ${alacritty_ranger} ${wezterm} ${wezterm_ranger} ${current} ${new}
  elif [[ "${current}" == 'kitty' ]] && [[ "${new}" == 'alacritty' ]]; then
    replacements ${kitty} ${kitty_ranger} ${alacritty} ${alacritty_ranger} ${current} ${new}
  elif [[ "${current}" == 'kitty' ]] && [[ "${new}" == 'wezterm' ]]; then
    replacements ${kitty} ${kitty_ranger} ${wezterm} ${wezterm_ranger} ${current} ${new}
  elif [[ "${current}" == 'wezterm' ]] && [[ "${new}" == 'alacritty' ]]; then
    replacements ${wezterm} ${wezterm_ranger} ${alacritty} ${alacritty_ranger} ${current} ${new}
  elif [[ "${current}" == 'wezterm' ]] && [[ "${new}" == 'kitty' ]]; then
    replacements ${wezterm} ${wezterm_ranger} ${kitty} ${kitty_ranger} ${current} ${new}
  fi

  unset dotfiles i3_conf bghtop alacritty alacritty_ranger kitty kitty_ranger wezterm wezterm_ranger OPT OPTARG current new
}

mkcd() {
  mkdir -p "${1}"
  cd "${1}"
}

if [[ $(grep '^PRETTY' /etc/os-release | awk -F '"' '{print $2}') == 'Arch Linux' ]]; then
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
fi

bootusb() {
  if [[ $# -eq 0 ]] || [[ $# -eq 1 ]]; then
    echo 'sudo dd bs=4M if=<1つ目の引数> of=<2つ目の引数> conv=fsync oflag=direct status=progress'
    return 1
  elif [[ $# -eq 2 ]]; then
    echo "sudo dd bs=4M if=${1} of=${2} conv=fsync oflag=direct status=progress"
    read "yn?実行しますか？(y/n): "
    case "${yn}" in
    [yY])
      sudo dd bs=4M "if=${1}" "of=${2}" conv=fsync oflag=direct status=progress
      ;;
    [nN])
      return 1
      ;;
    esac
  fi
}

raspi-backup() {
  sudo dd if=/dev/sde conv=sync,noerror iflag=nocache oflag=nocache,dsync | pv | pigz > "${1}"
}

tofish() {
  dotfiles="${HOME}/ghq/github.com/remon2207/dotfiles"

  startline=$(($(cat "${HOME}/.zshrc" | rg -n 'load fish' | cut -d ':' -f 1) + 1))

  endline=$(cat "${HOME}/.zshrc" | wc -l)

  sed -i "${startline},"${endline}"s/^# //" "${dotfiles}/.zshrc"
  sed -i '2s/^/# /' "${dotfiles}/.tmux.conf"
  sed -i '3s/^# //' "${dotfiles}/.tmux.conf"

  unset dotfiles startline endline

  if [[ $? -eq 0 ]]; then
    exit
  fi
}

authycheck() {
  version_number=$(curl -sL https://api.snapcraft.io/api/v1/snaps/search\?q=authy | jq | rg 'revision' | sed 's/ //g' | awk -F '[":,]' '{print $4}')

  echo "revision: ${version_number}"

  unset version_number
}

chpwd() {
  [[ $(pwd) != "${OLDPWD}" ]] && lsd -AF
}
