abbr -a j jobs
abbr -a dc cd
abbr -a e exit
abbr -a :q exit
abbr -a c clear
abbr -a rm rm -rf
abbr -a cp cp -a
abbr -a mkdir mkdir -p
abbr -a vimfont nvim $HOME/.config/fontconfig/fonts.conf
abbr -a vimwez nvim $HOME/.config/wezterm/wezterm.lua
abbr -a vimmime nvim $HOME/.config/mimeapps.list
abbr -a vimzsh "cd $HOME/.config/zsh/conf.d && nvim ."
abbr -a vimkitty "cd $HOME/.config/kitty/conf.d && nvim ."
abbr -a vimfish "cd $HOME/.config/fish && nvim ."
abbr -a vimconf "cd $HOME/.config/nvim/lua && nvim ."
abbr -a vimala "cd $HOME/.config/alacritty/conf.d && nvim ."
abbr -a vimi3 "cd $HOME/.config/i3/conf.d && nvim ."
abbr -a vimnorc nvim -u NORC
abbr -a grep grep --color=auto -in
abbr -a dexec docker compose exec
abbr -a drun docker compose run --rm
abbr -a ddown docker compose down
abbr -a dstop docker compose stop
abbr -a dup docker compose up -d
abbr -a dlog docker compose logs -f
abbr -a dps docker compose ps -a
abbr -a dbuild docker compose build
abbr -a g git
abbr -a ga git add
abbr -a gc git commit
abbr -a gp git push
abbr -a gb git branch
abbr -a gr git reset
abbr -a grh git reset --hard
abbr -a gl git log --oneline --graph
abbr -a gs git status
abbr -a gf git fetch
abbr -a gm git merge
abbr -a addall git add .
abbr -a cnow git commit -m \"update $(date '+%Y/%m/%d %H:%M:%S')\"
abbr -a unrequired pacman -Qtdq
abbr -a pacclean sudo pacman -Rns (pacman -Qtdq)
abbr -a psa ps auxf
abbr -a kf kitty + list-fonts --psname
abbr -a kdf kitty --debug-font-fallback
abbr -a bashrc nvim $HOME/.bashrc
abbr -a sb source $HOME/.bashrc
abbr -a sz source $HOME/.zshrc
abbr -a mpdstop mpd --kill
abbr -a dls sudo fdisk -l
abbr -a repeat xset r rate 250 60
abbr -a resetrepeat xset r rate
abbr -a visudo sudo EDITOR=nvim visudo
abbr -a renetwork sudo systemctl restart systemd-{networkd,resolved}.service
abbr -a ipscan sudo nmap -sP 192.168.1.0/24
abbr -a free free -th
abbr -a df df -Th
abbr -a svim sudoedit
abbr -a pn pnpm
abbr -a silicondate silicon -o $HOME/Pictures/screenshots/(date '+%Y-%m-%d_%H-%M-%S')_screenshot.png
abbr -a wmclass xprop WM_CLASS
abbr -a wmname xprop WM_NAME
abbr -a status sudo systemctl status
abbr -a start sudo systemctl start
abbr -a restart sudo systemctl restart
abbr -a stop sudo systemctl stop
abbr -a enable sudo systemctl enable
abbr -a disable sudo systemctl disable
abbr -a enablenow sudo systemctl enable --now
abbr -a disablenow sudo systemctl disable --now
abbr -a dot cd $HOME/ghq/github.com/remon2207/dotfiles
abbr -a tovi fish_vi_key_bindings
abbr -a toemacs fish_default_key_bindings
abbr -a lzd lazydocker
abbr -a lzg $HOME/.config/lazygit/symlink_workaround.sh
abbr -a t tmux
abbr -a rg rg -in
abbr -a r ranger
abbr -a manex tldr
abbr -a psag 'ps -auxf | rg -in'
abbr -a pkglist "pacman -Qqen > $HOME/ghq/github.com/remon2207/dotfiles/pkglist"
abbr -a pkglistaur "pacman -Qqe > $HOME/ghq/github.com/remon2207/dotfiles/pkglist_aur"
abbr -a homesize 'du -sm ./{*,.*} | sort -n'
abbr -a fontlist 'fc-list | fzf'
abbr -a dockerprune 'docker volume prune -fa && docker system prune -fa'
abbr -a tmp cd /tmp
abbr -a repo 'cd (ghq list -p | fzf)'
abbr -a raspi-backup 'sudo dd if=/dev/sde conv=sync,noerror iflag=nocache oflag=nocache,dsync | pv | pigz >'
abbr -a buildtemp "sudo sd '^#BUILDDIR' 'BUILDDIR' /etc/makepkg.conf"
abbr -a nobuildtemp "sudo sd '^BUILDDIR' '#BUILDDIR' /etc/makepkg.conf"
abbr -a bd 'bd -i &> /dev/null'
abbr -a less less -MiN
abbr -a cat cat -n
abbr -a vim nvim
abbr -a vim. nvim .
abbr -a killstartup 'killall Discord slack &> /dev/null'
abbr -a b bluetoothctl
abbr -a fpluginremove 'fisher remove (fisher list | fzf) 2> /dev/null'

if type lsd &> /dev/null
  abbr -a ls lsd
  abbr -a ll lsd -laF
  abbr -a la lsd -A
  abbr -a sl lsd
else
  abbr -a ls ls --color=auto
  abbr -a ll ls -laF --color=auto
  abbr -a la ls -A --color=auto
  abbr -a sl ls --color=auto
end

if test -z $DISPLAY
  abbr -a x startx
end
