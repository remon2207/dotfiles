#!/usr/bin/env bash

set -eu

usage() {
  cat << EOF
USAGE:
  ${0} <OPTIONS>
OPTIONS:
  -n        Username
  -e        Email of User
  -h        See Help
EOF
}

if [[ ${#} -ne 4 ]]; then
  usage
  exit 1
fi

while getopts 'n:m:h' opt; do
  case "${opt}" in
  'n')
    readonly NAME="${OPTARG}"
    ;;
  'm')
    readonly EMAIL="${OPTARG}"
    ;;
  'h')
    usage
    exit 0
    ;;
  '*')
    usage
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
