alias j='jobs'
alias dc='cd'
alias e='exit'
alias :q='exit'
alias c='clear'
alias sudo='sudo '
alias rm='rm -rf'
alias ls='ls --color=auto'
alias ll='ls -laF'
alias la='ls -A'
alias sl='ls'
alias mkdir='mkdir -p'
alias cfont="cd $HOME/.config/fontconfig"
alias fontconf="cd $HOME/.config/fontconfig && /usr/bin/nvim fonts.conf"
alias cvim="cd $HOME/.config/nvim/lua"
alias vimconf="cd $HOME/.config/nvim/lua && /usr/bin/nvim ."
alias cpolybar="cd $HOME/.config/polybar"
alias polybarconf="cd $HOME/.config/polybar && /usr/bin/nvim config.ini"
alias cpicom="cd $HOME/.config/picom"
alias picomconf="cd $HOME/.config/picom && /usr/bin/nvim picom.conf"
alias i3conf="cd $HOME/.config/i3 && /usr/bin/nvim config"
alias ci3="cd $HOME/.config/i3"
alias grep='grep --color=auto'
alias dexec='docker compose exec'
alias drun='docker compose run --rm'
alias ddown='docker compose down'
alias dup='docker compose up -d'
alias dlogs='docker compose logs -f'
alias dps='docker compose ps -a'
alias dbuild='docker compose build'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gsw='git switch'
alias gr='git reset'
alias grh='git reset --hard'
alias gl='git log --oneline --graph'
alias gs='git status'
alias gf='git fetch'
alias gm='git merge'
alias repoinit='echo "# $(basename $(pwd))" > README.md && git add . && git commit -m "Initial commit" && git push -u origin main'
alias addall='git add .'
alias cnow="git commit -m \"update: $(date '+%Y/%m/%d %H:%M:%S')\""
alias bghtop='nohup kitty -1 htop > /dev/null 2>&1 &!'
alias dockerprune='docker volume prune && docker system prune -a'
alias kittyconf="nvim $HOME/.config/kitty/kitty.conf"
alias ckitty="cd $HOME/.config/kitty"
alias cranger="cd $HOME/.config/ranger"
alias rangerconf="nvim $HOME/.config/ranger/rc.conf"
alias mirrorsync='sudo reflector --country Japan --sort rate --save /etc/pacman.d/mirrorlist; sudo pacman -Syy'
alias unrequired='pacman -Qtdq'
alias pacclean="sudo pacman -Rns $(pacman -Qtdq)"
alias psa='ps auxf'
alias psag='ps auxf | grep -i'
alias kf='kitty + list-fonts --psname'
alias kdf='kitty --debug-font-fallback'
alias sysoff='sudo systemctl poweroff'
alias sysre='sudo systemctl reboot'
alias syssp='sudo systemctl suspend'
alias bgp="nohup $1 > /dev/null 2>&1"
alias bashrc="nvim $HOME/.bashrc"
alias zshrc="nvim $HOME/.zshrc"
alias sz="source $HOME/.zshrc"
alias mpdstop='mpd --kill'
alias pkglist='pacman -Qqen > pkglist'
alias pkglistaur='pacman -Qqe > pkglist_aur'
alias repolybar='killall polybar; nohup polybar dp > /dev/null 2>&1 &! nohup polybar dvi > /dev/null 2>&1 &! nohup polybar hdmi > /dev/null 2>&1 &!'
alias slinfon='eslint_d stop && prettierd stop'
alias dls='sudo fdisk -l'
alias setxset='xset r rate 250 60'
alias visudo='sudo EDITOR=nvim visudo'
alias renetwork='sudo systemctl restart systemd-{networkd,resolved}.service'
alias ipscan='sudo nmap -sP 192.168.1.0/24'
alias status='sudo systemctl status'
alias restart='sudo systemctl restart'
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'

if [[ -n "$DISPLAY" ]]; then
  if type lsd > /dev/null 2>&1; then
    alias ls='lsd --color=auto'
    alias ll='lsd -alF --color=auto'
    alias la='lsd -A --color=auto'
  else
    alias ls='ls --color=auto'
    alias ll='ls -alF --color=auto'
    alias la='ls -A --color=auto'
  fi

  if type nvim > /dev/null 2>&1; then
    alias vim='nvim'
  fi

  alias killstartup='killall Discord slack polychromatic-tray-applet ckb-next'
  alias b='bluetoothctl'
else
  alias x='startx'
fi

# # common aliases
if type fd > /dev/null 2>&1; then
  alias find='fd'
fi

if type lazydocker > /dev/null 2>&1; then
  alias lzd='lazydocker'
fi

if type lazygit > /dev/null 2>&1; then
  alias lzg='lazygit'
fi

if type fzf > /dev/null 2>&1; then
  alias repos='ghq list -p | fzf'
  alias repo='cd $(repos)'
  alias fontlist='fc-list | fzf'
fi

if type tmux > /dev/null 2>&1; then
  alias t='tmux'
fi

if type rg > /dev/null 2>&1; then
  alias grep='rg --color=auto'
else
  alias grep='grep --color=auto'
fi

if type bat > /dev/null 2>&1; then
  alias cat='bat'
fi

if type ranger > /dev/null 2>&1; then
  alias r='ranger'
fi

if type tldr > /dev/null 2>&1; then
  alias rman='tldr'
fi

if type sd > /dev/null 2>&1; then
  alias sed='sd'
fi

if type delta > /dev/null 2>&1; then
  alias diff='delta -n'
fi

alias nvmupdate='nvm install --lts && npm i -g @fsouza/prettierd @johnnymorganz/stylua-bin eslint_d'

if [[ "$TERM" = "xterm-kitty" ]]; then
  alias ssh='kitty +kitten ssh'
  alias clear="printf '\033[2J\033[3J\033[1;1H'"
  alias c='clear'
fi
