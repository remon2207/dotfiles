psidkill() {
  ps_id="$(ps aux | rg --ignore-case --no-line-number "${1}" | awk 'NR==1 {print $2}')"

  kill ${ps_id}

  unset ps_id
}

changebrowser() {
  usage() {
    bat --plain << EOF
USAGE:
  changebrowser <OPTIONS>
OPTIONS:
  -c        Current browser
  -n        New browser
  -h        See Help
EOF
  }

  [[ ${#} -ne 4 ]] && usage && return 1

  mimeapps="${DOTFILES}/.config/mimeapps.list"
  kitty_conf="${DOTFILES}/.config/kitty/conf.d/advanced.conf"
  alacritty_conf="${DOTFILES}/.config/alacritty/conf.d/env.yml"

  replacements() {
    sd --string-mode "${1}" "${3}" "${mimeapps}"
    sd --string-mode "${2}" "${4}" "${kitty_conf}"
    sd --string-mode "${2}" "${4}" "${alacritty_conf}"
  }

  while getopts 'c:n:h' opt; do
    case "${opt}" in
    'c')
      current="${OPTARG}"
      ;;
    'n')
      new="${OPTARG}"
      ;;
    'h')
      usage && exit 0
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

  unset mimeapps kitty_conf alacritty_conf OPT OPTARG current new
}

changeterm() {
  usage() {
    bat --plain << EOF
USAGE:
  changeterm <OPTIONS>
OPTIONS:
  -c        Current terminal
  -n        new terminal
  -h        See Help
EOF
  }

  [[ ${#} -ne 4 ]] && usage && return 1

  i3_conf="${DOTFILES}/.config/i3/conf.d/appstart_keybind.conf"
  bghtop="${DOTFILES}/.local/share/applications/bghtop.desktop"
  alacritty='bindsym $mod+Return exec --no-startup-id alacritty'
  alacritty_ranger='bindsym $mod+e exec --no-startup-id alacritty --command ranger'
  kitty='bindsym $mod+Return exec --no-startup-id kitty'
  kitty_ranger='bindsym $mod+e exec --no-startup-id kitty --single-instance ranger'
  wezterm='bindsym $mod+Return exec --no-startup-id wezterm'
  wezterm_ranger='bindsym $mod+e exec --no-startup-id wezterm start ranger'

  replacements() {
    sd --string-mode "${1}" "# ${1}" "${i3_conf}"
    sd --string-mode "${2}" "# ${2}" "${i3_conf}"

    sd --string-mode "# ${3}" "${3}" "${i3_conf}"
    sd --string-mode "# ${4}" "${4}" "${i3_conf}"

    sd "^Exec=${5}" "# Exec=${5}" "${bghtop}"
    sd "^# Exec=${6}" "Exec=${6}" "${bghtop}"

    exit
  }

  while getopts 'c:n:h' opt; do
    case "${opt}" in
    'c')
      current="${OPTARG}"
      ;;
    'n')
      new="${OPTARG}"
      ;;
    'h')
      usage && exit 0
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

  unset i3_conf bghtop alacritty alacritty_ranger kitty kitty_ranger wezterm wezterm_ranger OPT OPTARG current new
}

bootusb() {
  case "${#}" in
  0 | 1)
    echo 'sudo dd bs=4M if=<1つ目の引数> of=<2つ目の引数> conv=fsync oflag=direct status=progress'
    return 1
    ;;
  2)
    echo "sudo dd bs=4M if=${1} of=${2} conv=fsync oflag=direct status=progress"
    read 'yn?実行しますか？(y/n): '
    case "${yn}" in
    ['yY'])
      sudo dd bs=4M "if=${1}" "of=${2}" conv=fsync oflag=direct status=progress
      ;;
    ['nN'])
      return 1
      ;;
    esac
    ;;
  esac
}

tofish() {
  startline="$(("$(bat --plain "${HOME}/.zshrc" | rg --line-number 'load fish' | cut --delimiter=':' --fields=1)" + 1))"
  endline="$(bat --plain "${HOME}/.zshrc" | wc --lines)"

  case "${distribution_name}" in
  'Gentoo Linux')
    sed --in-place --expression='2s/^/# /' "${DOTFILES}/.tmux_gentoo.conf"
    sed --in-place --expression='3s/^# //' "${DOTFILES}/.tmux_gentoo.conf"
    ;;
  'Arch Linux')
    sed --in-place --expression='2s/^/# /' "${DOTFILES}/.tmux_arch.conf"
    sed --in-place --expression='3s/^# //' "${DOTFILES}/.tmux_arch.conf"
    ;;
  esac
  sed --in-place --expression="${startline},${endline}s/^# //" "${DOTFILES}/.zshrc"

  unset startline endline

  [[ ${?} -eq 0 ]] && exit
}

authycheck() {
  result="$(curl --fail --silent --show-error --location --header 'Snap-Device-Series: 16' https://api.snapcraft.io/v2/snaps/info/authy | jq)"
  revision="$(echo "${result}" | rg 'revision' | awk --field-separator='[ ":,]*' '{print $3}')"
  version="$(echo "${result}" | rg 'version' | awk --field-separator='[ ":]*' '{print $3}')"

  echo "revision: ${revision}"
  echo "version: ${version}"

  unset result revision version
}

pkgupgrade() {
  distribution_name="$(rg '^PRETTY' /etc/os-release | awk --field-separator='"' '{print $2}')"

  case "${distribution_name}" in
  'Gentoo Linux')
    sudo emerge-webrsync
    sudo emaint sync --auto
    sudo emerge --ask --verbose --update --deep --newuse @world
    sudo emerge --ask --depclean
    ;;
  'Arch Linux')
    checkupdates

    if [[ ${?} -eq 0 ]]; then
      echo
      read 'yn?Do you want to update?(y/n): '
      case "${yn}" in
      ['yY'])
        paru -Syu "${@}"
        ;;
      ['nN'])
        return 1
        ;;
      esac
    fi
    ;;
  esac

  unset distribution_name
}

proxy() {
  flag="${1}"

  usage() {
    bat --plain << EOF
USAGE:
  proxy <OPTIONS>
OPTIONS:
  --on          Enable Proxy
  --off         Disable Proxy
  --help        See Help
EOF
  }

  case "${flag}" in
  '--on')
    sd '^(.*)# (export .*_proxy)' '$1$2' "${DOTFILES}/.profile"
    ;;
  '--off')
    sd '^(.*)(export .*_proxy)' '$1# $2' "${DOTFILES}/.profile"
    ;;
  '--help')
    usage
    ;;
  *)
    echo 'Not a valid option'
    return 1
    ;;
  esac

  unset flag
}

raspi-backup() { sudo dd if=/dev/sde conv=sync,noerror iflag=nocache oflag=nocache,dsync | pv | pigz > "${1}"; }
mkcd() { mkdir --parents "${1}" && cd "${_}"; }
psgrep() { ps aux | rg --ignore-case --no-line-number "${1}"; }
shtouch() { touch "${1}.sh" && chmod +x "${_}" && nvim "${_}"; }
nfind() { find "${@}" -not -path './.cache/*'; }
sfind() { sudo find "${@}" -not \( -path "${HOME}/.cache/*" -o -path '/mnt/*' \); }
chpwd() { [[ "$(pwd)" != "${OLDPWD}" ]] && lsd --almost-all --classify --ignore-glob '.git'; }
shellstart() { lsd --almost-all --classify --ignore-glob '.git'; }
shellstart