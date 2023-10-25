function tofirefox
  set -l dotfiles_dir $HOME/ghq/github.com/remon2207/dotfiles

  sd '(google-chrome|vivaldi-stable)' 'firefox' $dotfiles_dir/.config/mimeapps.list
  sd '(google-chrome-stable|vivaldi-stable)' 'firefox' $dotfiles_dir/.config/kitty/conf.d/advanced.conf
  sd '(google-chrome-stable|vivaldi-stable)' 'firefox' $dotfiles_dir/.config/alacritty/conf.d/env.yml
end
