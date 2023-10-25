function mirrorsync
  sudo cp -a /etc/pacman.d/mirrorlist{,.bak}
  sudo reflector --country Japan,Australia --age 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
  sudo pacman -Syy
end
