function tovivaldi
  set -l dotfiles_dir $HOME/ghq/github.com/remon2207/dotfiles

  sd '(firefox|google-chrome)' 'vivaldi-stable' $dotfiles_dir/.config/mimeapps.list
  sd '(firefox|google-chrome-stable)' 'vivaldi-stable' $dotfiles_dir/.config/kitty/conf.d/advanced.conf
  sd '(firefox|google-chrome-stable)' 'vivaldi-stable' $dotfiles_dir/.config/alacritty/conf.d/env.yml
end
