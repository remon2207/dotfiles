if [[ -n "$DISPLAY" ]]; then
  if [[  "$TERM" = "alacritty" ]]; then
    if [[ -z "$TMUX" ]] ;then
      ID="$( tmux ls 2> /dev/null | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
      if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
      else
        tmux attach-session -t "$ID" # if available attach to it
      fi
    fi
  fi
fi
