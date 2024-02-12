#!/usr/bin/env bash

set -eu

main() {
  local -r nfs_opts='nfs rw,async,nodev,nosuid,noexec,nouser,noatime,nofail,noauto,nomand,noiversion,norelatime,lazytime,_netdev,x-systemd.automount,x-systemd.idle-timeout=1min 0 0'
  local -r nfs_fstab="# nfs
192.168.1.46:/ /mnt/nfs ${nfs_opts}"

  sudo mkdir /mnt/nfs
  echo "${nfs_fstab}" | sudo tee --append /etc/fstab > /dev/null

  sudo systemctl daemon-reload
}

main "${@}"
