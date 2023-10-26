function ctrl-z
  set -l joblist (jobs)

  if test $status -eq 1
    return 1
  end

  fg "%$(jobs | awk -F 'C' '{print $1}' | fzf | awk '{print $1}')" &> /dev/null
  starship prompt
end
