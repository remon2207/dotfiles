function mirrorsync
  sudo reflector --country Japan --sort rate --save /etc/pacman.d/mirrorlist
  sudo pacman -Syy
end
