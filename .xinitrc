#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

/usr/local/bin/display_nouveau_setup.sh

xautolock -time 60 -locker "systemctl suspend" &
xset s off -dpms &
xset r rate 150 60 &
fcitx5 &
picom -b
feh --bg-scale ${HOME}/Pictures/wallpaper_linux/Circuit.png &
polybar dp &
polybar dvi &
polybar hdmi &
imwheel -b 45 &
discord &
slack &
# alacritty -e htop &
kitty -1 htop &
# google-chrome-stable --profile-directory=Default --app-id=ddiddklncfgbfaaahngklemobghhjkim &
# google-chrome-stable &
# vivaldi-stable --profile-directory=Default --app-id=hbdpomandigafcibbmofojjchbcdagbl &
# vivaldi-stable &
firefox-esr &
firefox &
exec i3
