if status is-interactive
  # Commands to run in interactive sessions can go here
  set fish_greeting

  bind \cz ctrl-z

  starship init fish | source
end

