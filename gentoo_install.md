```bash
# パーティショニング
gdisk /dev/sdc

# フォーマット
mkfs.ext4 /dev/sdc1 # /
mkfs.ext4 /dev/sdc2 # /home

# マウント
mount /dev/sdc1 /mnt/gentoo
mount -m /dev/sdc2 /mnt/gentoo/home
mount -m /dev/sdd1 /mnt/gentoo/boot

# stage tarball をダウンロード
cd /mnt/gentoo
links https://www.gentoo.org/downloads/mirrors/

# stage tarball を展開
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner

# コンパイルオプションを設定
# COMMON_FLAGS="-march=native -02 -pipe"
# MAKEOPTS="-j13"
# LINGUAS="ja en"
# L10N="ja en"
nano /mnt/gentoo/etc/portage/make.conf

# ミラーサーバーを選択する
mirrorselect -i -o >> /mnt/gentoo/etc/portage/make.conf

# Gentoo ebuild リポジトリ
mkdir -p /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
cat /mnt/gentoo/etc/portage/repos.conf/gentoo.conf

# DNS 情報をコピー
cp -L /etc/resolv.conf /mnt/gentoo/etc/

# 必要なファイルシステムをマウント
mount -t proc /proc /mnt/gentoo/proc
mount -R /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount -R /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
mount -B /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run

# 新しい環境に入る
chroot /mnt/gentoo /bin/bash
source /etc/profile
export PS1="(chroot) ${PS1}"

# Portage を設定する
emerge-webrsync

# Gentoo ebuild リポジトリを更新
emerge --sync -q

# ニュースを読む
eselect news read

# USE 変数を設定
# USE="X gtk -qt5 -qt6 -gnome -kde -plasma -wayland"
nano /etc/portage/make.conf

# 使用可能なUSEフラグ
less /var/db/repos/gentoo/profiles/use.desc

# プロファイルを選ぶ
eselect profile list

# /desktop/systemd
eselect profile set 12

# @worldの更新
emerge -avuDN @world

# neovimインストール
emerge -av neovim

# nanoアンインストール
emerge -c

# パッケージ毎にライセンスを許諾
mkdir -p /etc/portage/package.license
echo 'sys-kernel/linux-firmware @BINARY-REDISTRIBUTABLE' > /etc/portage/package.license/linux-firmware
echo 'sys-firmware/intel-microcode intel-ucode' > /etc/portage/package.license/intel-microcode

# タイムゾーン
ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# ロケールの設定
nvim /etc/locale.gen
locale-gen

# ロケールの選択
eselect locale list
eselect locale set 4

# 環境をリロード
env-update && source /etc/profile && export PS1="(chroot) ${PS1}"

# ファームウェアとマイクロコードのインストール
emerge -av sys-kernel/linux-firmware sys-firmware/intel-microcode sys-boot/efibootmgr

# カーネルのコンフィギュレーションとコンパイル
echo 'sys-apps/systemd gnuefi' > /etc/portage/package.use/systemd
emerge -av sys-kernel/installkernel-systemd-boot

# ディストリビューションカーネルをインストールする
emerge -av sys-kernel/gentoo-kernel-bin

# アップグレードと後処理
emerge -c

# fstabを編集
# PARTUUID=<PARTUUID> /boot vfat defaults,noatime 0 2
# PARTUUID=<PARTUUID> / ext4 defaults,noatime 0 1
# PARTUUID=<PARTUUID> /home ext4 defaults,noatime 0 2
blkid -s PARTUUID -o value /dev/sdd1 >> /etc/fstab
blkid -s PARTUUID -o value /dev/sdc1 >> /etc/fstab
blkid -s PARTUUID -o value /dev/sdc2 >> /etc/fstab
nvim /etc/fstab

# ホスト名
echo 'gentoo' > /etc/hostname

# rootパスワード
passwd

# init と boot 設定
systemd-firstboot --prompt
systemctl preset-all --preset-mode=enable-only

# ファイルシステムツール
emerge -av sys-fs/dosfstools

# ブートローダーの設定
bootctl install

# インストール/アップグレード後タスク
emerge -a @module-rebuild
emerge --config sys-kernel/gentoo-kernel-bin

# システムのリブート
exit
cd
umount -l /mnt/gentoo/dev{/shm,/pts,}
umount -R /mnt/gentoo
poweroff

# 再起動後
useradd -m -G wheel -s /bin/bash remon
passwd remon

# tar ファイルの削除
rm /stage3-*.tar.*

# DNS情報を更新
rm /etc/resolv.conf
ln -s /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# ネットワーク設定
# [Match]
# Name=enp6s0
#
# [Network]
# DHCP=yes
# DNS=192.168.1.202
nvim /etc/systemd/network/20-wired.network
systemctl restart systemd-networkd.service

# sudoのインストール
echo 'app-admin/sudo -sendmail' > /etc/portage/package.use/sudo
emerge -av sudo

# xorg と GPUのインストール
# VIDEO_CARDS="nvidia"
# INPUT_DEVICES="libinput"
nvim /etc/portage/make.conf
emerge -aUD @world
emerge -av x11-base/xorg-server
emerge -av x11-drivers/nvidia-drivers

# カーネルモジュールをロード
modprobe nvidia
# lsmod | grep 'nvidia'
# rmmod nvidia
# modprobe nvidia

# USEにnvidiaを追加
# USE="X gtk nvidia -qt5 -qt6 -gnome -kde -plasma -wayland"
nvim /etc/portage/make.conf

# 再ビルド
emerge -uDN @world

# i3 window manager インストール
emerge -av x11-wm/i3
emerge -av x11-misc/i3lock
emerge -av x11-misc/polybar
emerge -av x11-terms/kitty
```
