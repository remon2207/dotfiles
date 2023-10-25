function tochrome
  set -l dotfiles_dir $HOME/ghq/github.com/remon2207/dotfiles

  sd '(firefox|vivaldi-stable)' 'google-chrome' $dotfiles_dir/.config/mimeapps.list
  sd '(firefox|vivaldi-stable)' 'google-chrome-stable' $dotfiles_dir/.config/kitty/conf.d/advanced.conf
  sd '(firefox|vivaldi-stable)' 'google-chrome-stable' $dotfiles_dir/.config/alacritty/conf.d/env.yml
end
