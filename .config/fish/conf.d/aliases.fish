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
alias vimfont="nvim $HOME/.config/fontconfig/fonts.conf"
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
alias dstop='docker compose stop'
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
alias bghtop='nohup kitty -1 htop &> /dev/null &!'
alias dockerprune='docker volume prune && docker system prune -fa'
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
alias bgp="nohup $1 &> /dev/null"
alias bashrc="nvim $HOME/.bashrc"
alias zshrc="nvim $HOME/.zshrc"
alias sz="source $HOME/.zshrc"
alias mpdstop='mpd --kill'
alias pkglist='pacman -Qqen > pkglist'
alias pkglistaur='pacman -Qqe > pkglist_aur'
alias repolybar='killall polybar &> /dev/null; nohup polybar dp &> /dev/null &! nohup polybar dp2 &> /dev/null &! nohup polybar dvi &> /dev/null &! nohup polybar hdmi &> /dev/null &!'
alias slinfon='eslint_d stop && prettierd stop'
alias dls='sudo fdisk -l'
alias setxset='xset r rate 250 60'
alias visudo='sudo EDITOR=nvim visudo'
alias renetwork='sudo systemctl restart systemd-{networkd,resolved}.service'
alias ipscan='sudo nmap -sP 192.168.1.0/24'
alias ipscan='sudo nmap -sP 192.168.1.0/24'
alias free='free -th'
alias df='df -Th'
alias svim='sudoedit'
alias pn='pnpm'
alias tovim="cd $HOME/.config/nvim/lua"
alias toi3="cd $HOME/.config/i3/config.d"
alias toalacritty="cd $HOME/.config/alacritty"
alias tokitty="cd $HOME/.config/kitty"
alias tozsh="cd $HOME/.config/zsh/config.d"
alias wezvim="nvim $HOME/.config/wezterm/wezterm.lua"
alias silicondate="silicon -o $HOME/Pictures/screenshots/$(date '+%Y-%m-%d_%H-%M-%S')_screenshot.png"
alias bootusb="sudo dd bs=4M if=$argv[1] of=$argv[2] conv=fsync oflag=direct status=progress"
alias raspi-backup="sudo dd if=/dev/sde conv=sync,noerror iflag=nocache oflag=nocache,dsync | pv | pigz > $argv[1]"
alias wmclass='xprop WM_CLASS'

# # common aliases
if type lazydocker &> /dev/null
  alias lzd='lazydocker'
end

if type lazygit &> /dev/null
  alias lzg="$HOME/.config/lazygit/symlink_workaround.sh"
end

if type fzf &> /dev/null
  alias repos='ghq list -p | fzf'
  alias repo='cd $(repos)'
  alias fontlist='fc-list | fzf'
end

if type tmux &> /dev/null
  alias t='tmux'
end

if type rg &> /dev/null
  alias rg='rg --color=auto'
else
  alias grep='grep --color=auto'
end

if type ranger &> /dev/null
  alias r='ranger'
end

if type tldr &> /dev/null
  alias rman='tldr'
end

if test "$DISPLAY" = ':0'
  if type lsd &> /dev/null
    alias ls='lsd --color=auto'
    alias ll='lsd -alF --color=auto'
    alias la='lsd -A --color=auto'
  else
    alias ls='ls --color=auto'
    alias ll='ls -alF --color=auto'
    alias la='ls -A --color=auto'
  end

  if type nvim &> /dev/null
    alias vim='nvim'
  end

  alias killstartup='killall Discord slack polychromatic-tray-applet ckb-next'
  alias b='bluetoothctl'
else
  alias x='startx'
end
