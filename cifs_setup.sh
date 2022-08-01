#!/usr/bin/env bash

if [ ${#} -eq 0 ]; then
    exit
elif [ ${1} == "--help" ]; then
    cat <<EOF
Usage:
${0} <username> <password>
EOF
fi

pacman -Q cifs-utils > /dev/null 2>&1
if [ ${?} -eq 1 ]; then
    sudo pacman -S --noconfirm cifs-utils
fi

echo -e "username=${1}\n\
password=${2}" | sudo tee -a /etc/cifs-utils/.samba-rh

sudo mkdir /mnt/RH
echo -e "# /mnt/RH\n\
//192.168.1.73/RH /mnt/RH cifs credentials=/etc/cifs-utils/.samba-rh,iocharset=utf8,uid=1000,gid=1000,file_mode=0644,dir_mode=0755,rw,nodev,nosuid,noexec,nofail,noauto,_netdev,x-systemd.automount,x-systemd.device-timeout=10,x-systemd.idle-timeout=1min 0 0" | sudo tee -a /etc/fstab
