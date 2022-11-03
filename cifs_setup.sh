#!/usr/bin/env bash

if [ ${#} -eq 0 ]; then
  exit 0
elif [ ${1} = "--help" ] || [ ${1} = "-h" ]; then
  cat << EOF
Usage:
${0} <username> <password>
EOF
  exit 0
else
  pacman -Q cifs-utils > /dev/null 2>&1
  if [ ${?} -eq 1 ]; then
    sudo pacman -S --noconfirm cifs-utils
  fi

  cat << EOF | sudo tee /etc/cifs-utils/.samba > /dev/null
username=${1}
password=${2}
EOF

  sudo mkdir /mnt/RH
  cat << EOF | sudo tee -a /etc/fstab > /dev/null
# /mnt/RH
//192.168.1.80/RH /mnt/RH cifs vers=3.0,credentials=/etc/cifs-utils/.samba,iocharset=utf8,uid=1000,gid=1000,file_mode=0644,dir_mode=0755,rw,nodev,nosuid,noatime,noexec,nofail,noauto,_netdev,x-systemd.automount,x-systemd.requires=network-online.target,x-systemd.device-timeout=10,x-systemd.idle-timeout=1min 0 0
EOF
  sudo systemctl daemon-reload

  exit 0
fi
