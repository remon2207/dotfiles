#!/usr/bin/env bash

sudo pacman -S --noconfirm base-devel

sudo sed -i "s/-march=x86-64 -mtune=generic/-march=native/" /etc/makepkg.conf
sudo sed -i 's/^#MAKEFLAGS="-j2"/MAKEFLAGS="-j$(($(nproc)+1))"/' /etc/makepkg.conf
sudo sed -i "s/^#BUILDDIR/BUILDDIR/" /etc/makepkg.conf
sudo sed -i "s/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -z --threads=0 -)/" /etc/makepkg.conf
sudo sed -i "^#DefaultTimeoutStopSec=90s/DefaultTimeoutStopSec=10s/" /etc/systemd/system.conf

cd $(dirname $0)
./arch_setup.sh
