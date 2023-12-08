() {
  local plugins=(
    'Aloxaf/fzf-tab'
    'zsh-users/zsh-syntax-highlighting'
    'zsh-users/zsh-autosuggestions'
    'zsh-users/zsh-completions'
    'rupa/z'
  )

  for plugin in "${plugins[@]}"; do zinit light "${plugin}"; done
}

# solarized theme customize
[[ -n "${DISPLAY}" ]] && ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"
