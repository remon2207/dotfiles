alias j='jobs'
alias dc='cd'
alias e='exit'
alias :q='exit'
alias c='clear'
alias sudo='sudo '
alias rm='rm -rf'
alias mkdir='mkdir -p'
alias dot="cd ${HOME}/ghq/github.com/remon2207/dotfiles"
alias vimfont="nvim ${HOME}/.config/fontconfig/fonts.conf"
alias vimwez="nvim ${HOME}/.config/wezterm/wezterm.lua"
alias vimmime="nvim ${HOME}/.config/mimeapps.list"
alias vimzsh="cd ${HOME}/.config/zsh/conf.d && nvim ."
alias vimkitty="cd ${HOME}/.config/kitty/conf.d && nvim ."
alias vimfish="cd ${HOME}/.config/fish && nvim ."
alias vimconf="cd ${HOME}/.config/nvim/lua && nvim ."
alias vimala="cd ${HOME}/.config/alacritty/conf.d && nvim ."
alias vimi3="cd ${HOME}/.config/i3/conf.d && nvim ."
alias vimnorc='nvim -u NORC'
alias vimpolybar="nvim ${HOME}/.config/polybar/config.ini"
alias vimpicom="nvim ${HOME}/.config/picom/picom.conf"
alias grep='grep --color=auto -i'
alias dexec='docker compose exec'
alias drun='docker compose run --rm'
alias ddown='docker compose down'
alias dstop='docker compose stop'
alias dup='docker compose up -d'
alias dlog='docker compose logs -f'
alias dps='docker compose ps -a'
alias dbuild='docker compose build'
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gsw='git switch'
alias gco='git checkout'
alias gr='git reset'
alias grh='git reset --hard'
alias gl='git log --oneline --graph'
alias gs='git status'
alias gf='git fetch'
alias gm='git merge'
alias gd='git diff'
alias commitnow="git commit -m \"$(date '+%Y/%m/%d %H:%M:%S')\""
alias nowpush="git add . && git commit -m \"$(date '+%Y/%m/%d %H:%M:%S')\" && git push"
alias bghtop='nohup kitty -1 htop &> /dev/null &!'
alias dockerprune='docker volume prune -fa && docker system prune -fa'
alias psa='ps aux'
alias kf='kitty + list-fonts --psname'
alias kdf='kitty --debug-font-fallback'
alias sysoff='sudo systemctl poweroff'
alias sysre='sudo systemctl reboot'
alias syssp='sudo systemctl suspend'
alias sysstatus='sudo systemctl status'
alias sysrestart='sudo systemctl restart'
alias sysstart='sudo systemctl start'
alias sysstop='sudo systemctl stop'
alias sysenable='sudo systemctl enable'
alias sysenablenow='sudo systemctl enable --now'
alias sysdisable='sudo systemctl disable'
alias sysdisablenow='sudo systemctl disable --now'
alias sysnstatus='systemctl --user status'
alias sysnrestart='systemctl --user restart'
alias sysnstart='systemctl --user start'
alias sysnstop='systemctl --user stop'
alias sysnenable='systemctl --user enable'
alias sysnenablenow='systemctl --user enable --now'
alias sysndisable='systemctl --user disable'
alias sysndisablenow='systemctl --user disable --now'
alias bashrc="nvim ${HOME}/.bashrc"
alias zshrc="nvim ${HOME}/.zshrc"
alias sz=". ${HOME}/.zshrc"
alias mpdstop='mpd --kill'
alias repolybar='killall polybar &> /dev/null; nohup polybar dp &> /dev/null &! nohup polybar dp2 &> /dev/null &! nohup polybar dvi &> /dev/null &! nohup polybar hdmi &> /dev/null &!'
alias disklist='sudo fdisk -l'
alias setkeyrepeat='xset r rate 250 60'
alias resetkeyrepeat='xset r rate'
alias renetwork='sudo systemctl restart systemd-{networkd,resolved}.service'
alias ipscan='sudo nmap -sP 192.168.1.0/24'
alias free='free -th'
alias df='df -Th'
alias svim='sudoedit'
alias pn='pnpm'
alias silicondate="silicon -o ${HOME}/Pictures/screenshots/$(date '+%Y-%m-%d_%H-%M-%S')_screenshot.png"
alias manex='tldr'
alias lzd='lazydocker'
alias lzg="${HOME}/.config/lazygit/symlink_workaround.sh"
alias repo='cd "$(ghq list -p | fzf)"'
alias fontlist='fc-list | fzf | awk -F "[:,]" "{print \$2}" | cut -d " " -f 2-'
alias t='tmux'
alias rg='rg -iN'
alias r='ranger'
alias less='less -MiN'
alias homesize='du -sm "./"{*,.*} | sort -n'
alias tmp="cd ${HOME}/tmp"
alias wmclassname='xprop WM_CLASS WM_NAME'
alias nft='sudo nft'
alias ipt='sudo iptables'
alias ip6t='sudo ip6tables'
alias autosuspend='nohup xautolock -time 60 -locker "systemctl suspend" &> /dev/null &!'
alias autosuspendoff='killall "xautolock"'
alias fd='fd -HE "/mnt" -E "${HOME}/.cache"'
alias pnupdate='pn i -g @fsouza/prettierd eslint_d'

case "${distribution_name}" in
'Arch Linux')
  alias mirrorsync='sudo reflector --country Japan --age 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && sudo pacman -Syy'
  alias unrequired='pacman -Qtdq'
  alias pacclean='sudo pacman -Rns "$(pacman -Qtdq)"'
  alias pkglist="pacman -Qqen > ${HOME}/ghq/github.com/remon2207/dotfiles/pkglist"
  alias pkglistaur="pacman -Qqe > ${HOME}/ghq/github.com/remon2207/dotfiles/pkglist_aur"
  alias nobuildtemp='sudo sd "^#(BUILDDIR)" "\$1" /etc/makepkg.conf'
  alias buildtemp='sudo sd "^(BUILDDIR)" "#\$1" /etc/makepkg.conf'
  ;;
'Gentoo Linux')
  alias pkgclean='sudo emerge --ask --depclean'
  ;;
esac

if type lsd &> /dev/null; then
  alias ls='lsd'
  alias ll='lsd -lAFI ".git"'
  alias la='lsd -AFI ".git"'
  alias sl='lsd'
else
  alias ls='ls --color=auto'
  alias ll='ls -lAFI ".git" --color=auto'
  alias la='ls -AFI ".git" --color=auto'
  alias sl='ls --color=auto'
fi

if type nvim &> /dev/null; then
  alias vim='nvim'
  alias vim.='nvim .'
fi

if [[ -n "${DISPLAY}" ]]; then
  alias killstartup='killall Discord slack &> /dev/null'
  alias b='bluetoothctl'
else
  alias x='startx'
fi

if [[ "${TERM}" == "xterm-kitty" ]]; then
  alias kittyssh='kitty +kitten ssh'
  alias c='printf "\e[H\e[3J"'
fi
