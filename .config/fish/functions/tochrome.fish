function tochrome
  set -l dotfiles_dir $HOME/ghq/github.com/remon2207/dotfiles

  # /usr/bin/sed -i 's/export BROWSER=\'\(firefox\|vivaldi-stable\)\'/export BROWSER=\'google-chrome-stable\'/' $dotfiles_dir/.profile
  /usr/bin/sed -i 's/\(firefox\|vivaldi-stable\)/google-chrome/' $dotfiles_dir/.config/mimeapps.list
  /usr/bin/sed -i 's/\(firefox\|vivaldi-stable\)/google-chrome-stable/' $dotfiles_dir/.config/kitty/conf.d/advanced.conf
  /usr/bin/sed -i 's/\(firefox\|vivaldi-stable\)/google-chrome-stable/' $dotfiles_dir/.config/alacritty/conf.d/env.yml
end
