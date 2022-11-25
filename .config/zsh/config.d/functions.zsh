psidkill() {
  ps_id=$(ps auxf | grep -i $1  | awk '{print $2}' | head -n 1)
  kill $ps_id
}

tochrome() {
  dotfiles_dir="$HOME/ghq/github.com/remon2207/dotfiles"

  /usr/bin/sed -i 's/export BROWSER="\(firefox\|vivaldi-stable\)"/export BROWSER="google-chrome-stable"/' $dotfiles_dir/.zprofile
  /usr/bin/sed -i 's/\(firefox\|vivaldi-stable\)/google-chrome/' $dotfiles_dir/.config/mimeapps.list
  /usr/bin/sed -i 's/\(firefox\|vivaldi-stable\)/google-chrome-stable/' $dotfiles_dir/.config/kitty/advanced.conf
}

tofirefox() {
  dotfiles_dir="$HOME/ghq/github.com/remon2207/dotfiles"

  /usr/bin/sed -i 's/export BROWSER="google-chrome-stable"/export BROWSER="firefox"/' $dotfiles_dir/.zprofile
  /usr/bin/sed -i 's/google-chrome/firefox/' $dotfiles_dir/.config/mimeapps.list
  /usr/bin/sed -i 's/google-chrome-stable/firefox/' $dotfiles_dir/.config/kitty/advanced.conf
}

tovivaldi() {
  dotfiles_dir="$HOME/ghq/github.com/remon2207/dotfiles"

  /usr/bin/sed -i 's/export BROWSER="\(google-chrome-stable\|firefox\)"/export BROWSER="vivaldi-stable"/' $dotfiles_dir/.zprofile
  /usr/bin/sed -i 's/\(google-chrome\|firefox\)/vivaldi-stable/' $dotfiles_dir/.config/mimeapps.list
  /usr/bin/sed -i 's/\(google-chrome-stable\|firefox\)/vivaldi-stable/' $dotfiles_dir/.config/kitty/advanced.conf
}

nobuildtemp() {
  sudo /usr/bin/sed -i 's/^BUILDDIR=\/tmp\/makepkg/#BUILDDIR=\/tmp\/makepkg/' /etc/makepkg.conf
}

buildtemp() {
  sudo /usr/bin/sed -i 's/^#BUILDDIR=\/tmp\/makepkg/BUILDDIR=\/tmp\/makepkg/' /etc/makepkg.conf
}

psidc() {
  ps_id=$(ps auxf | grep -i $1  | awk '{print $2}' | head -n 1)
  echo $ps_id
  echo $ps_id | xclip
}

wmclass() {
  xprop WM_CLASS | awk -F '"' '{print $4}'
}

mkcd() {
  mkdir -p $1 && cd $1
}

cup() {
  checkupdates
  if [ $? -eq 0 ]; then
    echo
    read "yn?Do you want to update?(y/n): "
    case "$yn" in
      [yY]) paru -Syu ;;
    esac
  fi
  return 1
}

unset dotfiles_dir
