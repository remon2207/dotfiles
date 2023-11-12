zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit promptinit
compinit
promptinit
prompt gentoo

HISTFILE="${HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

IS_ARCH=$(grep '^PRETTY' /etc/os-release | awk -F '"' '{print $2}')

# keybind
bindkey -e

source "${HOME}/.config/zsh/conf.d/term.zsh"
source "${HOME}/.config/zsh/conf.d/zinit.zsh"
source "${HOME}/.config/zsh/conf.d/options.zsh"
source "${HOME}/.config/zsh/conf.d/styles.zsh"
source "${HOME}/.config/zsh/conf.d/functions.zsh"
source "${HOME}/.config/zsh/conf.d/aliases.zsh"

eval "$(starship init zsh)"

[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ "${IS_ARCH}" == 'Arch Linux' ]] && source /usr/share/fzf/completion.zsh
unset IS_ARCH

[[ -f "${HOME}/.profile" ]] && source "${HOME}/.profile"

# load fish
# if [[ $(ps --no-header -o comm) != 'fish' ]]; then
#   if type fish &> /dev/null; then
#     exec fish
#   fi
# fi
