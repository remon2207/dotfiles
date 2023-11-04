#!/usr/bin/env bash

set -eu

if [[ $# -eq 0 ]]; then
  exit 1
else
  sudo mkdir -p /mnt/share01/{rh,server}
  cat << EOF | sudo tee -a /etc/fstab > /dev/null

# nfs
192.168.1.33:/mnt/share01/rh     /mnt/share01/rh     nfs rw,async,nodev,nosuid,noexec,noatime,nofail,noauto,nomand,noiversion,norelatime,lazytime,x-systemd.automount,x-systemd.idle-timeout=1min 0 0
192.168.1.33:/mnt/share01/server /mnt/share01/server nfs rw,async,nodev,nosuid,noexec,noatime,nofail,noauto,nomand,noiversion,norelatime,lazytime,x-systemd.automount,x-systemd.idle-timeout=1min 0 0
EOF
  sudo systemctl daemon-reload

  exit 0
fi
