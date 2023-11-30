exec_term() {
  if [[ "${TERM}" == 'alacritty' ]] || [[ "${TERM}" == 'xterm-256color' ]] && [[ "${TERM_PROG}" == 'alacritty' ]]; then
    if [[ -z "${TMUX}" ]]; then
      ID="$(tmux ls 2> /dev/null | grep --invert-match --max-count=1 'attached' | cut --delimiter=':' --fields=1)"
      if [[ -z ${ID} ]]; then
        tmux new-session
      else
        tmux attach-session -t ${ID}
      fi
    fi
    exit
  fi
}

exec_term
