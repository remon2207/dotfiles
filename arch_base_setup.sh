#!/usr/bin/env bash

sudo sed -i "s/^#NTP=/NTP=0.asia.pool.ntp.org 1.asia.pool.ntp.org 2.asia.pool.ntp.org 3.asia.pool.ntp.org/" /etc/systemd/timesyncd.conf
sudo sed -i "s/^#FallbackNTP/FallbackNTP/" /etc/systemd/timesyncd.conf
sudo sed -i "s/-march=x86-64 -mtune=generic/-march=native/" /etc/makepkg.conf
sudo sed -i 's/^#MAKEFLAGS="-j2"/MAKEFLAGS="-j$(($(nproc)+1))"/' /etc/makepkg.conf
sudo sed -i "s/^#BUILDDIR/BUILDDIR/" /etc/makepkg.conf
sudo sed -i "s/^COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -z --threads=0 -)/" /etc/makepkg.conf
sudo sed -i "s/^#DefaultTimeoutStopSec=90s/DefaultTimeoutStopSec=10s/" /etc/systemd/system.conf

sudo pacman -S --noconfirm \
base-devel \
vi \
nano \
nano-syntax-highlighting \
zsh \
curl \
wget \
fzf \
zip \
unzip \
gufw \
git \
cifs-utils \
openssh \
htop \
man \
ntfs-3g \
exfat-utils \
firefox \
firefox-i18n-ja \
wireplumber \
pipewire \
pipewire-pluse \
pavucontrol \
rustup \
xdg-user-dirs-gtk \
noto-fonts \
noto-fonts-cjk \
noto-fonts-emoji \
fcitx5 \
fcitx5-im \
fcitx5-mozc \
gnome-keyring \
qt5ct \
kvantum \
docker \
docker-compose \
evice \
gvfs \
github-cli \
xarchiver \
discord \
neofetch \
tree \
gsmartcontrol

cd $(dirname $0)
./arch_setup.sh
