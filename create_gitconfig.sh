#!/usr/bin/env bash

set -eu

readonly HELP="USAGE:
  ${0} [OPTIONS]
OPTIONS:
  -n, --name     Username
  -e, --email    Email of user"

if [[ $# -eq 0 ]] || [ $# -ne 4 ] || [[ "${1}" == '-h' ]] || [[ "${1}" == '--help' ]]; then
  echo "${HELP}"
  exit 1
fi

while getopts 'n:m:' opt; do
  case "${opt}" in
  n)
    readonly NAME="${OPTARG}"
    ;;
  m)
    readonly EMAIL="${OPTARG}"
    ;;
  *)
    echo 'bat option'
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
