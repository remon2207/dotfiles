vsh() {
  [[ ${#} -ge 2 ]] && echo '引数が多い' && return 1

  nvim -- "${1}".sh

  if [[ -e "$(pwd)/${1}.sh" ]]; then
    chmod +x "${1}.sh"
  else
    echo 'ファイルがありません'
  fi
}

savelayout() {
  i3-save-tree --workspace "${1}" > "${XDG_CONFIG_HOME}/i3/workspace_${1}.json"
  sed --in-place --expression='s|^\(\s*\)// "|\1"|g; /^\s*\/\//d' "${XDG_CONFIG_HOME}/i3/workspace_${1}.json"

  return
}

mgmtrepo() {
  usage() {
    bat --plain << EOF
USAGE:
  mgmtrepo <OPTIONS>
OPTIONS:
  -d        削除
  -v        ブラウザで開く
  -h        ヘルプを見る
EOF

    return
  }

  if [[ ${#} -eq 0 ]]; then
    return 1
  elif [[ "${1}" == '-h' ]]; then
    usage
    return
  elif [[ "${1}" != '-d' ]] && [[ "${1}" != '-v' ]]; then
    return 1
  fi

  local selected
  selected="$(gh repo list \
    | awk '{print $1}' \
    | sort \
    | fzf)"

  if [[ ${?} -eq 0 ]]; then
    case "${1}" in
      '-d')
        gh repo delete "${selected}"
        ;;
      '-v')
        gh repo view --web "${selected}"
        ;;
    esac
  else
    return 1
  fi

  return
}

terminalspeed() {
  local i

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

bootusb() {
  case ${#} in
    0 | 1)
      echo 'sudo dd bs=4M if=<1つ目の引数> of=<2つ目の引数> conv=fsync oflag=direct status=progress'
      return 1
      ;;
    2)
      local yn

      echo "sudo dd bs=4M if=${1} of=${2} conv=fsync oflag=direct status=progress"
      read 'yn?実行しますか？(y/n): '
      echo
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

pkgup() {
  checkupdates

  if [[ ${?} -eq 0 ]]; then
    local yn

    echo
    read 'yn?アップグレードしますか？(y/n): '

    [[ "${yn}" == 'y' ]] && paru --sync --refresh --sysupgrade --removemake "${@}"
  fi

  return
}

keyrepeat() {
  [[ ${#} -eq 0 ]] && xset r rate 250 60 && return

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

gaddf() {
  local selected
  selected="$(git status --short \
    | fzf --multi --preview="echo {} | awk '{print \$2}' | xargs git diff --color" \
    | awk '{print $2}')"
  if [[ -n "${selected}" ]]; then
    tr '\n' ' ' <<< "${selected}" \
      | xargs git add \
      && echo -e "Completed:\n${selected}"
  fi

  return
}

gedit() {
  local selected
  selected="$(git status --short \
    | awk '{print $2}' \
    | fzf --preview='bat {} --color=always --style=changes,header-filename,numbers')"

  [[ -n "${selected}" ]] && nvim -- "${selected}" && echo "nvim -- ${selected}"

  return
}

gnowpush() {
  if [[ "${1}" == '-a' ]]; then
    git add .
  elif [[ ${#} -ge 1 ]]; then
    return 1
  fi

  if [[ -n "$(git diff --name-only --staged)" ]]; then
    git commit --message="$(date '+%Y/%m/%d %H:%M:%S')" && git push
  else
    echo 'ステージングエリアに追加してください'
    return 1
  fi

  return
}

repo() {
  usage() {
    bat --plain << EOF
USAGE:
  repo <options>
OPTIONS:
  -r        選択したリポジトリを削除
  -h        ヘルプを表示
EOF

    return
  }

  local flag="${1}"
  [[ "${flag}" == '-h' ]] && usage && return

  local selected="$(ghq list --full-path \
    | rg --invert-match '^.*/dotfiles$' \
    | sort \
    | fzf --preview-window='50%' --preview='lsd --tree {}')"
  if [[ -n "${selected}" ]] && [[ -z "${flag}" ]]; then
    cd "${selected}"
  elif [[ -n "${selected}" ]] && [[ "${flag}" == '-r' ]]; then
    rm "${selected}"
  fi

  return
}

siliconnow() {
  [[ ! -d "${HOME}/Pictures/codes" ]] && mkdir --parents "${HOME}/Pictures/codes"
  silicon --output="${HOME}/Pictures/codes/${1}_$(date '+%Y-%m-%d_%H-%M-%S').png" "${1}"

  return
}

fdalltype() {
  local type
  for type in file directory symlink executable empty socket pipe; do fd "${@}" --type="${type}"; done

  return
}

lzg() {
  cd "$(readlink --canonicalize .)" &> /dev/null && lazygit "${@}" && cd - &> /dev/null

  return
}

stee() {
  sudo tee "${1}" > /dev/null

  return
}

gcommitnow() {
  git commit --message="$(date '+%Y/%m/%d %H:%M:%S')"

  return
}

gdf() {
  local selected

  selected="$(git status --short \
    | fzf --multi \
    | awk '{print $2}')"

  [[ -n "${selected}" ]] && tr '\n' ' ' <<< "${selected}" | xargs git diff

  return
}

raspibackup() {
  sudo dd if='/dev/sde' conv='sync,noerror' iflag='nocache' oflag='nocache,dsync' \
    | pv \
    | pigz > "${1}"

  return
}

mkcd() {
  mkdir --parents "${1}" && cd "${_}"

  return
}

nfind() {
  find "${@}" -not \( -path '*/.cache/*' -o -path '*/.git/*' \)

  return
}

sfind() {
  sudo find "${@}" -not \( -path "*/.cache/*" -o -path '*/.git/*' -o -path '/mnt/*' -o -path '*/ccache/*' \)

  return
}
