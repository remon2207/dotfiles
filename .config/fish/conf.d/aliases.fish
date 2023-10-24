abbr -a j jobs
abbr -a dc cd
abbr -a e exit
abbr -a e exit
abbr -a :q exit
abbr -a c clear
abbr -a rm rm -rf
abbr -a ls ls --color=auto
abbr -a ll ls -laF
abbr -a la ls -A
abbr -a sl ls
abbr -a mkdir mkdir -p
abbr -a vimfont nvim $HOME/.config/fontconfig/fonts.conf
abbr -a vimwez nvim $HOME/.config/wezterm/wezterm.lua
abbr -a vimmime nvim $HOME/.config/mimeapps.list
abbr -a grep grep --color=auto
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
abbr -a pacclean sudo pacman -Rns $(pacman -Qtdq)
abbr -a psa ps auxf
abbr -a kf kitty + list-fonts --psname
abbr -a kdf kitty --debug-font-fallback
abbr -a bashrc nvim $HOME/.bashrc
abbr -a sb source $HOME/.bashrc
abbr -a sz source $HOME/.zshrc
abbr -a mpdstop mpd --kill
abbr -a dls sudo fdisk -l
abbr -a setxset xset r rate 250 60
abbr -a visudo sudo EDITOR=nvim visudo
abbr -a renetwork sudo systemctl restart systemd-{networkd,resolved}.service
abbr -a ipscan sudo nmap -sP 192.168.1.0/24
abbr -a free free -th
abbr -a df df -Th
abbr -a svim sudoedit
abbr -a pn pnpm
abbr -a silicondate silicon -o $HOME/Pictures/screenshots/$(date '+%Y-%m-%d_%H-%M-%S')_screenshot.png
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
abbr -a plugin_install fisher install jorgebucaran/nvm.fish jethrokuan/fzf jethrokuan/z
abbr -a lzd lazydocker
abbr -a lzg $HOME/.config/lazygit/symlink_workaround.sh
abbr -a t tmux
abbr -a rg rg --color auto
abbr -a r ranger
abbr -a rman tldr

# # common aliases
# if type lazydocker &> /dev/null
#   alias lzd='lazydocker'
# end
#
# if type lazygit &> /dev/null
#   alias lzg="$HOME/.config/lazygit/symlink_workaround.sh"
# end

# if type fzf &> /dev/null
#   alias repos='ghq list -p | fzf'
#   alias repo='cd $(repos)'
#   alias fontlist='fc-list | fzf'
# end

if test "$DISPLAY" = ':0'
  if type lsd &> /dev/null
    abbr -a ls lsd --color auto
    abbr -a ll lsd -alF --color auto
    abbr -a la lsd -A --color auto
  else
    abbr -a ls ls --color=auto
    abbr -a ll -alF --color=auto
    abbr -a la ls -A --color=auto
  end

  if type nvim &> /dev/null
    abbr -a vim nvim
  end

  abbr -a killstartup killall Discord slack
  abbr -a b bluetoothctl
else
  abbr -a x startx
end
