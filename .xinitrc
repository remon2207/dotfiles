#!/bin/sh

userresources="${HOME}/.Xresources"
usermodmap="${HOME}/.Xmodmap"
sysresources='/etc/X11/xinit/.Xresources'
sysmodmap='/etc/X11/xinit/.Xmodmap'

# merge in defaults and keymaps

[ -f "${sysresources}" ] && xrdb -merge "${sysresources}"
[ -f "${sysmodmap}" ] && xmodmap "${sysmodmap}"
[ -f "${userresources}" ] && xrdb -merge "${userresources}"
[ -f "${usermodmap}" ] && xmodmap "${usermodmap}"

# start some nice programs

if [ -d '/etc/X11/xinit/xinitrc.d' ]; then
  for f in '/etc/X11/xinit/xinitrc.d/'?*'.sh'; do
    # shellcheck disable=SC1090
    [ -x "${f}" ] && . "${f}"
  done
  unset f
fi

[ -f "${HOME}/.profile" ] && . "${HOME}/.profile"

exec /usr/bin/i3
