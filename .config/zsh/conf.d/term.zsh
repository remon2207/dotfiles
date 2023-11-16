exec_term() {
  if [[ -n "${DISPLAY}" ]]; then
    if [[ "${TERM}" == 'alacritty' ]] || [[ "${TERM}" == 'xterm-256color' ]] && [[ "${TERM_PROG}" == 'alacritty' ]]; then
      if [[ -z "${TMUX}" ]]; then
        ID=$(tmux ls 2> /dev/null | grep -vm1 'attached' | cut -d ':' -f 1) # get the id of a deattached session
        if [[ -z ${ID} ]]; then                                             # if not available create a new one
          tmux new-session
        else
          tmux attach-session -t ${ID} # if available attach to it
        fi
      fi
      exit
    fi
  fi
}

exec_term
