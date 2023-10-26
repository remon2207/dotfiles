#!/bin/sh

userresources="${HOME}/.Xresources"
usermodmap="${HOME}/.Xmodmap"
sysresources='/etc/X11/xinit/.Xresources'
sysmodmap='/etc/X11/xinit/.Xmodmap'

# merge in defaults and keymaps

if [ -f "${sysresources}" ]; then
  xrdb -merge "${sysresources}"
fi

if [ -f "${sysmodmap}" ]; then
  xmodmap "${sysmodmap}"
fi

if [ -f "${userresources}" ]; then
  xrdb -merge "${userresources}"
fi

if [ -f "${usermodmap}" ]; then
  xmodmap "${usermodmap}"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "${f}" ] && . "${f}"
  done
  unset f
fi

if [ -f "${HOME}/.profile" ]; then
  . "${HOME}/.profile"
fi

# /opt/display_nouveau_setup.sh

xautolock -time 60 -locker "systemctl suspend" &
xset s off -dpms &
xset r rate 250 60 &
polybar dp &
polybar dp2 &
polybar dvi &
polybar hdmi &
picom -b &
fcitx5 &
feh --bg-max "${HOME}/Pictures/wallpaper_linux/75.png" &
#hsetroot -solid '#000000' &
#mpd $HOME/.config/mpd/mpd.conf
discord &
slack &
# alacritty -e htop &
kitty -1 htop &
# wezterm -e htop &
exec i3
