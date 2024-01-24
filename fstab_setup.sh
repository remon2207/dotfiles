#!/usr/bin/env bash

set -eu

main() {
  local -r nfs_opts='nfs rw,async,nodev,nosuid,noexec,noatime,nofail,noauto,nomand,noiversion,norelatime,lazytime,x-systemd.automount,x-systemd.idle-timeout=1min 0 0'
  local -r nfs_fstab="# nfs
192.168.1.33:/mnt/share01/rh     /mnt/rh     ${nfs_opts}
192.168.1.33:/mnt/share01/server /mnt/server ${nfs_opts}"

  sudo mkdir /mnt/{rh,server}
  echo "${nfs_fstab}" | sudo tee --append /etc/fstab > /dev/null

  sudo systemctl daemon-reload
}

main "${@}"
