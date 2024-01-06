#!/usr/bin/env bash

set -eu

nfs_opts='nfs rw,async,nodev,nosuid,noexec,noatime,nofail,noauto,nomand,noiversion,norelatime,lazytime,x-systemd.automount,x-systemd.idle-timeout=1min 0 0'
nfs_fstab="# nfs
192.168.1.33:/mnt/share01/rh     /mnt/share/rh     ${nfs_opts}
192.168.1.33:/mnt/share01/server /mnt/share/server ${nfs_opts}"

sudo mkdir --parents /mnt/share/{rh,server}
echo "${nfs_fstab}" | sudo tee --append /etc/fstab &> /dev/null

sudo systemctl daemon-reload
