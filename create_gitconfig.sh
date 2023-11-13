#!/usr/bin/env bash

set -eu

usage() {
  cat << EOF
  ${0} <OPTIONS>
OPTIONS:
  -n    Username
  -e    Email of User
EOF
}

if [[ $# -eq 0 ]] || [ $# -ne 4 ] || [[ "${1}" == '-h' ]] || [[ "${1}" == '--help' ]]; then
  usage
  exit 1
fi

while getopts 'n:m:' opt; do
  case "${opt}" in
  'n')
    readonly NAME="${OPTARG}"
    ;;
  'm')
    readonly EMAIL="${OPTARG}"
    ;;
  '*')
    echo 'Not a valid option'
    exit 1
    ;;
  esac
done

cat << EOF > "${HOME}/.gitconfig"
[user]
  name = ${NAME}
  email = ${EMAIL}
[commit]
  template = ${HOME}/commit.template
[core]
  pager = delta --syntax-theme 'Solarized (dark)'
[interactive]
  diffFilter = delta --color-only --syntax-theme 'Solarized (dark)'
EOF
