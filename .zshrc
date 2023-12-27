DISTRIBUTION_NAME="$(uname -a | awk '{print $2}')"
DOTFILES="${HOME}/ghq/github.com/remon2207/dotfiles"
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
[[ -d "${XDG_CONFIG_HOME}/zsh/completions" ]] && fpath=("${XDG_CONFIG_HOME}/zsh/completions" "${fpath[@]}")

if [[ "${DISTRIBUTION_NAME}" == 'gentoo' ]]; then
  autoload -Uz compinit promptinit
  compinit
  promptinit
  prompt gentoo
else
  autoload -Uz compinit
  compinit
fi

() {
  local file
  local files=('options' 'aliases' 'functions' 'plugins' 'styles')
  for file in "${files[@]}"; do . "${XDG_CONFIG_HOME}/zsh/${file}.zsh"; done
}

[[ -f '/usr/share/fzf/key-bindings.zsh' ]] && . /usr/share/fzf/key-bindings.zsh
[[ "${DISTRIBUTION_NAME}" == 'archlinux' ]] && . /usr/share/fzf/completion.zsh
[[ -s "${NVM_DIR}/nvm.sh" ]] && . "${NVM_DIR}/nvm.sh"

bindkey -e

eval "$(starship init zsh)"
