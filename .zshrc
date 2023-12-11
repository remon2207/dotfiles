DISTRIBUTION_NAME="$(uname -a | awk '{print $2}')"
DOTFILES="${HOME}/ghq/github.com/remon2207/dotfiles"
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

if [[ "${DISTRIBUTION_NAME}" == 'gentoo' ]]; then
  autoload -Uz compinit promptinit
  compinit
  promptinit
  prompt gentoo
else
  autoload -Uz compinit
  compinit
fi

# shellcheck disable=SC1073,1072
() {
  local file
  local files=('options' 'aliases' 'functions' 'plugins' 'styles' 'completions')
  for file in "${files[@]}"; do . "${HOME}/.config/zsh/${file}.zsh"; done
}

[[ -f '/usr/share/fzf/key-bindings.zsh' ]] && . /usr/share/fzf/key-bindings.zsh
[[ "${DISTRIBUTION_NAME}" == 'archlinux' ]] && . /usr/share/fzf/completion.zsh
[[ -s "${NVM_DIR}/nvm.sh" ]] && . "${NVM_DIR}/nvm.sh"

bindkey -e

eval "$(starship init zsh)"

# load fish
# if [[ "$(ps --no-header -o comm)" != 'fish' ]]; then
#   type fish &> /dev/null && exec fish
# fi
