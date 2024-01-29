chpwd() {
  la

  return
}

# ターミナル起動時に実行
() {
  # プラグインマネージャーの自動インストール
  # =========================================
  if [[ ! -f "${HOME}/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir --parents "${HOME}/.local/share/zinit" && command chmod g-rwX "${HOME}/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "${HOME}/.local/share/zinit/zinit.git" && \
      print -P "%F{33} %F{34}Installation successful.%f%b" || \
      print -P "%F{160} The clone has failed.%f%b"
  fi

  . "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit
  # =========================================

  # ターミナルがAlacrittyなら自動でtmuxを起動
  # =========================================
  # if [[ "${TERM}" == 'alacritty' ]] || [[ "${TERM}" == 'xterm-256color' ]]; then
  #   if [[ "${TERM_PROG}" == 'alacritty' ]]; then
  #     if [[ -z "${TMUX}" ]]; then
  #       ID="$(tmux ls 2> /dev/null \
  #         | rg --invert-match --max-count=1 'attached' \
  #         | awk --field-separator=':' '{print $1}')"
  #       if [[ -z ${ID} ]]; then
  #         tmux new-session
  #       else
  #         tmux attach-session -t ${ID}
  #       fi
  #     fi
  #     exit
  #   fi
  # fi
  # =========================================

  [[ -n "${DISPLAY}" ]] && la

  return
}
