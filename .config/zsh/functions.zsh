terminalspeed() {
  for i in {1..400000}; do
    echo -e '\r'
    echo -e '\033[0K\033[1mBold\033[0m \033[7mInvert\033[0m \033[4mUnderline\033[0m'
    echo -e '\033[0K\033[1m\033[7m\033[4mBold & Invert & Underline\033[0m'
    echo
    echo -e '\033[0K\033[31m Red \033[32m Green \033[33m Yellow \033[34m Blue \033[35m Magenta \033[36m Cyan \033[0m'
    echo -e '\033[0K\033[1m\033[4m\033[31m Red \033[32m Green \033[33m Yellow \033[34m Blue \033[35m Magenta \033[36m Cyan \033[0m'
    echo
    echo -e '\033[0K\033[41m Red \033[42m Green \033[43m Yellow \033[44m Blue \033[45m Magenta \033[46m Cyan \033[0m'
    echo -e '\033[0K\033[1m\033[4m\033[41m Red \033[42m Green \033[43m Yellow \033[44m Blue \033[45m Magenta \033[46m Cyan \033[0m'
    echo
    echo -e '\033[0K\033[30m\033[41m Red \033[42m Green \033[43m Yellow \033[44m Blue \033[45m Magenta \033[46m Cyan \033[0m'
    echo -e '\033[0K\033[30m\033[1m\033[4m\033[41m Red \033[42m Green \033[43m Yellow \033[44m Blue \033[45m Magenta \033[46m Cyan \033[0m'
  done

  return
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

  local mimeapps="${DOTFILES}/.config/mimeapps.list"
  local kitty_conf="${DOTFILES}/.config/kitty/conf.d/advanced.conf"
  local alacritty_conf="${DOTFILES}/.config/alacritty/conf.d/env.yml"

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
      usage && return 0
      ;;
    *)
      usage && return 1
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

  return
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

  local i3_conf="${DOTFILES}/.config/i3/conf.d/keybind.conf"
  local bghtop="${DOTFILES}/.local/share/applications/bghtop.desktop"
  local alacritty='bindsym $mod+Return exec --no-startup-id alacritty'
  local alacritty_ranger='bindsym $mod+e exec --no-startup-id alacritty --command ranger'
  local kitty='bindsym $mod+Return exec --no-startup-id kitty'
  local kitty_ranger='bindsym $mod+e exec --no-startup-id kitty --single-instance ranger'
  local wezterm='bindsym $mod+Return exec --no-startup-id wezterm'
  local wezterm_ranger='bindsym $mod+e exec --no-startup-id wezterm start ranger'

  replacements() {
    sd --string-mode "${1}" "# ${1}" "${i3_conf}"
    sd --string-mode "${2}" "# ${2}" "${i3_conf}"

    sd --string-mode "# ${3}" "${3}" "${i3_conf}"
    sd --string-mode "# ${4}" "${4}" "${i3_conf}"

    sd "^Exec=${5}" "# Exec=${5}" "${bghtop}"
    sd "^# Exec=${6}" "Exec=${6}" "${bghtop}"

    sd "^(export TERMINAL='/usr/bin)/${5}'" "\$1/${6}'" "${DOTFILES}/.profile"

    [[ $? -eq 0 ]] && exit
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
      usage && return 0
      ;;
    *)
      usage && return 1
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

  return
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
      sudo dd bs='4M' if="${1}" of="${2}" conv='fsync' oflag='direct' status='progress'
      ;;
    ['nN'])
      return 1
      ;;
    esac
    ;;
  esac

  return
}

tofish() {
  local startline="$(("$(bat --plain "${HOME}/.zshrc" | rg --line-number 'load fish' | cut --delimiter=':' --fields=1)" + 1))"
  local endline="$(bat --plain "${HOME}/.zshrc" | wc --lines)"

  case "${DISTRIBUTION_NAME}" in
  'gentoo')
    sed --in-place --expression='2s/^/# /' "${DOTFILES}/.tmux_gentoo.conf"
    sed --in-place --expression='3s/^# //' "${DOTFILES}/.tmux_gentoo.conf"
    ;;
  'archlinux')
    sed --in-place --expression='2s/^/# /' "${DOTFILES}/.tmux_arch.conf"
    sed --in-place --expression='3s/^# //' "${DOTFILES}/.tmux_arch.conf"
    ;;
  esac

  sed --in-place --expression="${startline},${endline}s/^# //" "${DOTFILES}/.zshrc"

  [[ ${?} -eq 0 ]] && exit
}

authycheck() {
  local result="$(curl --header 'Snap-Device-Series: 16' https://api.snapcraft.io/v2/snaps/info/authy | jq)"
  local revision="$(echo "${result}" | rg 'revision' | awk --field-separator='[ ":,]*' '{print $3}')"
  local version="$(echo "${result}" | rg 'version' | awk --field-separator='[ ":]*' '{print $3}')"

  echo "revision: ${revision}"
  echo "version: ${version}"

  return
}

upgrade() {

  case "${DISTRIBUTION_NAME}" in
  'gentoo')
    [[ "${1}" == '-s' ]] && sudo emerge-webrsync
    sudo emaint --auto sync
    sudo emerge --ask --update --deep --newuse @world
    sudo emerge --ask --verbose='n' --depclean
    ;;
  'archlinux')
    checkupdates

    if [[ ${?} -eq 0 ]]; then
      echo
      read 'yn?アップグレードしますか?(y/n): '
      case "${yn}" in
      ['yY'])
        paru --sync --refresh --sysupgrade "${@}"
        ;;
      ['nN'])
        return 1
        ;;
      esac
    fi
    ;;
  esac

  return
}

proxy() {
  local flag="${1}"

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
    usage && return 0
    ;;
  *)
    usage && return 1
    ;;
  esac

  return
}

gentoocp() {
  local gentoo_setup="${HOME}/ghq/github.com/remon2207/gentoo-setup"

  rsync --archive --update --delete --verbose /etc/portage/{make.conf,package.{accept_keywords,license,use,mask}} "${gentoo_setup}"
  zcat /proc/config.gz > "${gentoo_setup}/kernel_conf"
  zcat /proc/config.gz | sudo tee /usr/src/kernel_conf_bak &> /dev/null

  return
}

nvmupgrade() {
  cd "${NVM_DIR}"
  git fetch --tags origin
  git switch --detach "${@}"

  [[ $? -eq 0 ]] && exit
}

keyrepeat() {
  [[ $# -eq 0 ]] && xset r rate 250 60 && return

  cmd="$(getopt --options='' --longoptions='reset' -- "${@}")"
  eval set -- "${cmd}"
  unset cmd

  while true; do
    case "${1}" in
      '--reset')
        xset r rate
        shift
        ;;
      '--')
        shift
        break
        ;;
    esac
  done

  return
}

lzg() { cd "$(readlink --canonicalize .)" &> /dev/null && lazygit "${@}" && cd - &> /dev/null; return; }
stee() { sudo tee "${1}" &> /dev/null; return; }
nowpush() { [[ "${1}" == '-a' ]] && git add .; git commit --message="$(date '+%Y/%m/%d %H:%M:%S')" && git push; return; }
commitnow() { git commit --message="$(date '+%Y/%m/%d %H:%M:%S')"; return; }
gdf() { git diff "$(git status | awk '/^\smodified:/{print $2}' | fzf)"; return; }
addchange() { git add "$(git status | awk '/^\smodified:/,0 {print $2}' | rg --invert-match --regexp '^not' --regexp '^"git' --regexp '^changes' | tac | sed --expression='1d' | fzf)"; return; }
adduntrack() { git add "$(git status | awk '/git add <file>/,0' | sed --expression='1d' --expression='s/^\s//g' | fzf)"; return; }
raspibackup() { sudo dd if='/dev/sde' conv='sync,noerror' iflag='nocache' oflag='nocache,dsync' | pv | pigz > "${1}"; return; }
mkcd() { mkdir --parents "${1}" && cd "${_}"; return; }
psgrep() { procs "${1}"; return; }
shtouch() { touch "${1}.sh" && chmod +x "${_}" && nvim "${_}"; return; }
nfind() { find "${@}" -not \( -path '*/.cache/*' -o -path '*/.git/*' \); return; }
sfind() { sudo find "${@}" -not \( -path "*/.cache/*" -o -path '*/.git/*' -o -path '/mnt/*' -o -path '*/ccache/*' \); return; }
ebuildinstall() { sudo ebuild "${1}" manifest clean test install; return; }
ebuildclean() { sudo ebuild "${1}" manifest clean; return; }
silicondate() { silicon --output="${HOME}/Pictures/screenshots/$(date '+%Y-%m-%d_%H-%M-%S')_screenshot.png" "${@}"; return; }

# ターミナル起動時に実行
chpwd() { la; return; }
() {
  # プラグインマネージャーの自動インストール
  # =========================================
  if [[ ! -f "${HOME}/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir --parents "${HOME}/.local/share/zinit" && command chmod g-rwX "${HOME}/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "${HOME}/.local/share/zinit/zinit.git" && \
      print -P "%F{33} %F{34}Installation successful.%f%b" || \
      print -P "%F{160} The clone has failed.%f%b"
  fi

  . "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit
  # =========================================

  # ターミナルがAlacrittyなら自動でtmuxを起動
  # =========================================
  if [[ "${TERM}" == 'alacritty' ]] || [[ "${TERM}" == 'xterm-256color' ]] && [[ "${TERM_PROG}" == 'alacritty' ]]; then
    if [[ -z "${TMUX}" ]]; then
      ID="$(tmux ls 2> /dev/null | rg --invert-match --max-count=1 'attached' | awk --field-separator=':' '{print $1}')"
      if [[ -z ${ID} ]]; then
        tmux new-session
      else
        tmux attach-session -t ${ID}
      fi
    fi
    exit
  fi
  # =========================================

  la

  return
}
