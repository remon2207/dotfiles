```bash
# パーティショニング
gdisk /dev/sdd

# フォーマット
mkfs.vfat -F 32 /dev/sdd1
mkfs.ext4 /dev/sdc2 # /
mkfs.ext4 /dev/sdc3 # /home

# マウント
mount /dev/sdd2 /mnt/gentoo
mount -m -o fmask=0077,dmask=0077 /dev/sdd1 /mnt/gentoo/boot
mount -m /dev/sdd3 /mnt/gentoo/home

# stage tarball をダウンロード
cd /mnt/gentoo
links https://www.gentoo.org/downloads/mirrors/

# stage tarball を展開
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner

# コンパイルオプションを設定
# COMMON_FLAGS="-march=skylake -02 -pipe"
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
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run

# 新しい環境に入る
chroot /mnt/gentoo /bin/bash
source /etc/profile
export PS1="(chroot) ${PS1}"

# Portage を設定する
emerge-webrsync

# Gentoo ebuild リポジトリを更新
emerge --sync --quiet

# ニュースを読む
eselect news read

# USE 変数を設定
# USE="cjk systemd -X -gtk -elogind -syslog -qt5 -qt6 -gnome -kde -plasma -wayland"
nano /etc/portage/make.conf
echo 'sys-apps/systemd boot' > /etc/portage/package.use/systemd

# 使用可能なUSEフラグ
less /var/db/repos/gentoo/profiles/use.desc

# プロファイルを選ぶ
eselect profile list

# /desktop/systemd
eselect profile set 12

# @worldの更新
emerge -avuDN @world

# neovimインストール
echo 'app-editors/neovim -nvimpager' > /etc/portage/package.use/neovim
emerge -av neovim
emerge -c

# パッケージ毎にライセンスを許諾
mkdir /etc/portage/package.license
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
echo 'sys-firmware/intel-microcode initramfs' > /etc/portage/package.use/intel-microcode
emerge -av sys-kernel/linux-firmware sys-firmware/intel-microcode

# カーネルのマニュアルインストール
emerge -av sys-kernel/gentoo-sources
cd /usr/src/linux
make menuconfig
make -j13 && make -j13 modules_install
make install

# initramfsのビルド
emerge -av sys-kernel/dracut
dracut --kver <kernel-version>-gentoo
ls /boot/initramfs*

# アップグレードと後処理
emerge -avuDN @world
emerge -c

# fstabを編集
# PARTUUID=<PARTUUID> /boot vfat defaults,noatime,fmask=0077,dmask=0077 0 2
# PARTUUID=<PARTUUID> /     ext4 defaults,noatime 0 1
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
systemd-machine-id-setup
systemd-firstboot --prompt
systemctl preset-all

# ブートローダーの設定
bootctl install

cd /boot/loader
# default      gentoo.conf
# timeout      10
# console-mode max
# editor       no
nvim loader.conf
cd entries
# title      Gentoo
# linux      /vmlinuz
# initrd     /initramfs
# machine-id <machine-id>
# options    root=PARTUUID=<PARTUUID> rw loglevel=3 panic=180
nvim gentoo.conf
cat /etc/machine-id >> gentoo.conf
blkid -s PARTUUID -o value /dev/sdd2 >> gentoo.conf
nvim gentoo.conf

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
# USE="cjk nvidia systemd X gtk -elogind -syslog -qt5 -qt6 -gnome -kde -plasma -wayland"
# VIDEO_CARDS="nvidia"
# INPUT_DEVICES="libinput"
nvim /etc/portage/make.conf
emerge -avuDN @world
emerge -av x11-base/xorg-server

# 再ビルド
emerge -avuDN @world
gpasswd -a remon video

# カーネルモジュールをロード
modprobe nvidia
# lsmod | grep 'nvidia'
# rmmod nvidia
# modprobe nvidia

# i3 window manager インストール
emerge -av x11-wm/i3
emerge -av x11-misc/i3lock
emerge -av x11-misc/polybar
emerge -av x11-terms/kitty
```

