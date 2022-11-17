dotfiles_dir="$HOME/ghq/github.com/remon2207/dotfiles"

psidkill() {
  ps_id=$(ps auxf | grep -i $1  | awk '{print $2}' | head -n 1)
  kill $ps_id
}

tochrome() {
  /usr/bin/sed -i 's/export BROWSER="firefox"/export BROWSER="google-chrome-stable"/' $dotfiles_dir/.zprofile
  /usr/bin/sed -i 's/firefox/google-chrome/' $dotfiles_dir/.config/mimeapps.list
}

tofirefox() {
  /usr/bin/sed -i 's/export BROWSER="google-chrome-stable"/export BROWSER="firefox"/' $dotfiles_dir/.zprofile
  /usr/bin/sed -i 's/google-chrome/firefox/' $dotfiles_dir/.config/mimeapps.list
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

unset dotfiles_dir
