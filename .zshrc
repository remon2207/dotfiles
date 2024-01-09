DOTFILES="${HOME}/ghq/github.com/remon2207/dotfiles"
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
[[ -d "${XDG_CONFIG_HOME}/zsh/completions" ]] && fpath=("${XDG_CONFIG_HOME}/zsh/completions" "${fpath[@]}")

autoload -Uz compinit
compinit

() {
  local file
  local files=('options' 'aliases' 'functions' 'plugins' 'styles')
  for file in "${files[@]}"; do source "${HOME}/.config/zsh/${file}.zsh"; done
}

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/nvm/init-nvm.sh

bindkey -e

eval "$(starship init zsh)"
