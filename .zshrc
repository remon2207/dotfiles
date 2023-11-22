zstyle :compinstall filename "${HOME}/.zshrc"

distribution_name="$(rg '^PRETTY' /etc/os-release | awk -F '"' '{print $2}')"

if [[ "${distribution_name}" == 'Gentoo Linux' ]]; then
  autoload -Uz compinit promptinit
  compinit
  promptinit
  prompt gentoo
else
  autoload -Uz compinit
  compinit
fi

HISTFILE="${HOME}/.zsh_history"
HISTSIZE=100000
# shellcheck disable=SC2034
SAVEHIST=100000

# keybind
bindkey -e

source "${HOME}/.config/zsh/conf.d/term.zsh"
source "${HOME}/.config/zsh/conf.d/zinit.zsh"
source "${HOME}/.config/zsh/conf.d/options.zsh"
source "${HOME}/.config/zsh/conf.d/styles.zsh"
source "${HOME}/.config/zsh/conf.d/functions.zsh"
source "${HOME}/.config/zsh/conf.d/aliases.zsh"

eval "$(starship init zsh)"

# shellcheck disable=SC1094
[[ -f '/usr/share/fzf/key-bindings.zsh' ]] && source /usr/share/fzf/key-bindings.zsh
# shellcheck disable=SC1091
[[ "${distribution_name}" == 'Arch Linux' ]] && source /usr/share/fzf/completion.zsh
unset distribution_name

[[ -f "${HOME}/.profile" ]] && source "${HOME}/.profile"

shellstart() {
  la
}

shellstart

# load fish
# if [[ $(ps --no-header -o comm) != 'fish' ]]; then
#   if type fish &> /dev/null; then
#     exec fish
#   fi
# fi
