psidkill() {
  ps_id=$(ps auxf | grep -i $1  | awk '{print $2}' | head -n 1)
  kill $ps_id
}

tochrome() {
  /usr/bin/sed -i 's/export BROWSER="firefox"/export BROWSER="google-chrome-stable"/' $HOME/ghq/github.com/remon2207/dotfiles/.zprofile
}

tofirefox() {
  /usr/bin/sed -i 's/export BROWSER="google-chrome-stable"/export BROWSER="firefox"/' $HOME/ghq/github.com/remon2207/dotfiles/.zprofile
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
