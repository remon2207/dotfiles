#!/usr/bin/env bash

set -eu

if [[ $# -eq 0 ]]; then
  exit 0
elif [ "${1}" == '--help' ] || [ "${1}" == '-h' ]; then
  cat << EOF
Usage:
$0 <username> <password>
EOF
  exit 0
else
  pacman -Q cifs-utils &> /dev/null
  if [[ $? -eq 1 ]]; then
    sudo pacman -S --noconfirm cifs-utils
  fi

  cat << EOF | sudo tee /etc/cifs-utils/.samba > /dev/null
username="${1}"
password="${2}"
EOF

  partuuid=$(blkid | grep 'linux-windows' | cut -d '"' -f 12)
  sudo mkdir /mnt/{share01,linux-windows}
  sudo mkdir /mnt/share01/{rh,server}
  cat << EOF | sudo tee -a /etc/fstab > /dev/null
# /mnt/share01/rh
#//192.168.1.33/rh /mnt/share01/rh cifs vers=3.0,credentials=/etc/cifs-utils/.samba,iocharset=utf8,uid=1000,gid=1000,file_mode=0644,dir_mode=0755,rw,nodev,nosuid,noatime,noexec,nofail,noauto,nomand,noiversion,norelatime,lazytime,_netdev,x-systemd.automount,x-systemd.idle-timeout=1min 0 0

# /mnt/linux-windows
PARTUUID=${partuuid} /mnt/linux-windows ntfs-3g uid=1000,gid=1000,dmask=022,fmask=133,nodev,nosuid,noatime,noexec,nofail,noauto,nomand,noiversion,norelatime,lazytime,x-systemd.automount,x-systemd.idle-timeout=1min 0 0

# nfs
192.168.1.33:/mnt/share01/rh /mnt/share01/rh nfs rw,async,nodev,nosuid,noexec,noatime,nofail,noauto,nomand,noiversion,norelatime,lazytime,_netdev,x-systemd.automount,x-systemd.idle-timeout=1min 0 0
192.168.1.33:/mnt/share01/server /mnt/share01/server nfs rw,async,nodev,nosuid,noexec,noatime,nofail,noauto,nomand,noiversion,norelatime,lazytime,_netdev,x-systemd.automount,x-systemd.idle-timeout=1min 0 0
EOF
  sudo systemctl daemon-reload

  exit 0
fi
