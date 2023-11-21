#!/usr/bin/env bash

set -eu

nfs_opts='nfs rw,async,nodev,nosuid,noexec,noatime,nofail,noauto,nomand,noiversion,norelatime,lazytime,x-systemd.automount,x-systemd.idle-timeout=1min 0 0'
nfs_fstab="# nfs
192.168.1.33:/mnt/share01/rh     /mnt/share01/rh     ${nfs_opts}
192.168.1.33:/mnt/share01/server /mnt/share01/server ${nfs_opts}"

sudo mkdir -p /mnt/share01/{rh,server}
echo "${nfs_fstab}" | sudo tee -a /etc/fstab &> /dev/null
unset nfs_opts nfs_fstab

sudo systemctl daemon-reload
