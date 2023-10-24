function sf
  set -l fish $HOME/.config/fish
  set -l path $fish/config.fish $fish/conf.d/*.fish $fish/functions/*.fish

  for file in $path
    source $file
  end
end
