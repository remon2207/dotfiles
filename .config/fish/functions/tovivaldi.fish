function tovivaldi
  set -l dotfiles_dir "$HOME/ghq/github.com/remon2207/dotfiles"

  /usr/bin/sed -i 's/export BROWSER=\'\(google-chrome-stable\|firefox\)\'/export BROWSER=\'vivaldi-stable\'/' $dotfiles_dir/.profile
  /usr/bin/sed -i 's/\(google-chrome-stable\|firefox\)/vivaldi-stable/' $dotfiles_dir/.config/kitty/advanced.conf
  /usr/bin/sed -i 's/\(firefox\|google-chrome-stable\)/vivaldi-stable/' $dotfiles_dir/.config/alacritty/env.yml
  /usr/bin/sed -i 's/\(google-chrome\|firefox\)/vivaldi-stable/' $dotfiles_dir/.config/mimeapps.list
end
