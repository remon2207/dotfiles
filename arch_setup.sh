#!/usr/bin/env bash

paru_install() {
    pkgname="paru-bin"
    git clone https://aur.archlinux.org/${pkgname}.git
    cd ${pkgname}
    makepkg -si --noconfirm --needed
    cd ${HOME}
    rm -rf ${pkgname}

    return 0
}

aur_install() {
    paru -S --noconfirm --needed google-chrome ghq-bin postman-bin visual-studio-code-bin spotify ttf-cica downgrade
    mkdir -p ${HOME}/.cache/paru/clone/
    cd $_
    paru -G jdim-git
    cd $_
    sed -i "s/^source=('git/source=('git+https/" PKGBUILD
    makepkg -si --noconfirm --needed

    return 0
}

2chproxy() {
    pacman -Q perl-lwp-protocol-https > /dev/null 2>&1
    if [ ${?} -eq 1 ]; then
        sudo pacman -S --noconfirm --needed perl-lwp-protocol-https
    fi

    pacman -Q ghq-bin > /dev/null 2>&1
    if [ ${?} -eq 1 ]; then
        paru -S --noconfirm --needed ghq-bin
    fi

    cd ${HOME}
    ghq get yama-natuki/2chproxy.pl
    mkdir -p ${HOME}/.local/bin/
    jdim
    ./ghq/github.com/yama-natuki/2chproxy.pl/install.sh ${HOME}/.local/bin
    firefox_version=$(firefox --version | awk -F ' ' '{print $3}' | awk -F '.' '{print $1}')
    sed -i "s/Firefox\/[0-9][0-9]/Firefox\/${firefox_version}/" ${HOME}/.local/bin/2chproxy.pl

    return 0
}

other() {
    cat << EOF > ${HOME}/.local/share/applications/mozc.desktop
[Desktop Entry]
Type=Application
Name=Mozc の 設定
Icon=/usr/share/icons/hicolor/128x128/apps/org.fcitx.Fcitx5.fcitx-mozc.png
Exec=/usr/lib/mozc/mozc_tool --mode=config_dialog
Terminal=false
EOF

    return 0
}

get_de=$(neofetch | grep "GNOME" | awk -F ':' '{print $2}' | awk -F ' ' '{print $2}')
if [ ${get_de} == "GNOME" ]; then
    other

    return 0
fi
paru_install
aur_install
2chproxy
