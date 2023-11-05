zinit_install() {
  if [[ ! -f "${HOME}/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "${HOME}/.local/share/zinit" && command chmod g-rwX "${HOME}/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "${HOME}/.local/share/zinit/zinit.git" && \
      print -P "%F{33} %F{34}Installation successful.%f%b" || \
      print -P "%F{160} The clone has failed.%f%b"
  fi

  source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit
}

zinit_install

#zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
#zinit light zsh-users/zsh-completions
zinit light marlonrichert/zsh-autocomplete
zinit light rupa/z

# keymap
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete


if [[ -n "${DISPLAY}" ]]; then
  # solarized theme customize
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"
fi
