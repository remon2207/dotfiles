#!/usr/bin/env bash

if [ "$#" -eq 0 ]; then
  exit 0
elif [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
  cat << EOF
Usage:
$0 <username> <password>
EOF
  exit 0
else
  pacman -Q cifs-utils > /dev/null 2>&1
  if [ "$?" -eq 1 ]; then
    sudo pacman -S --noconfirm cifs-utils
  fi

  cat << EOF | sudo tee /etc/cifs-utils/.samba > /dev/null
username="$1"
password="$2"
EOF

  sudo mkdir /mnt/{RH,linux-windows}
  cat << EOF | sudo tee -a /etc/fstab > /dev/null
# /mnt/RH
//raspberrypi.local/RH /mnt/RH cifs vers=3.0,credentials=/etc/cifs-utils/.samba,iocharset=utf8,uid=1000,gid=1000,file_mode=0644,dir_mode=0755,rw,nodev,nosuid,noatime,noexec,nofail,noauto,_netdev,x-systemd.automount,x-systemd.requires=network-online.target,x-systemd.device-timeout=10,x-systemd.idle-timeout=1min 0 0

# /mnt/linux-windows
PARTUUID=fe32ec92-a0c4-4aa8-ad27-a562129f1f04 /mnt/linux-windows ntfs-3g uid=1000,gid=1000,dmask=022,fmask=133,nodev,nosuid,noatime,noexec,nofail,noauto 0 0
EOF
  sudo systemctl daemon-reload

  exit 0
fi
