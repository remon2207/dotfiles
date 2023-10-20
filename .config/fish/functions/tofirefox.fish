function tofirefox
  set -l dotfiles_dir "$HOME/ghq/github.com/remon2207/dotfiles"

  /usr/bin/sed -i 's/export BROWSER=\'\(google-chrome-stable\|vivaldi-stable\)\'/export BROWSER=\'firefox\'/' $dotfiles_dir/.profile
  /usr/bin/sed -i 's/\(google-chrome-stable\|vivaldi-stable\)/firefox/' $dotfiles_dir/.config/kitty/advanced.conf
  /usr/bin/sed -i 's/\(google-chrome-stable\|vivaldi-stable\)/firefox/' $dotfiles_dir/.config/alacritty/env.yml
  /usr/bin/sed -i 's/\(google-chrome|vivaldi-stable\)/firefox/' $dotfiles_dir/.config/mimeapps.list
end
