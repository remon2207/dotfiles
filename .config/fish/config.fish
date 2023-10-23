if status is-interactive
  # Commands to run in interactive sessions can go here
  set fish_greeting

  bind -M insert -m default jj force-repaint

  starship init fish | source
end

