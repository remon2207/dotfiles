function repo
  cd $(ghq list -p | fzf)
end
