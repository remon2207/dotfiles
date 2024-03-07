alias dc='cd'
alias e='exit'
alias :q='exit'
alias c='clear'
alias rm='rm --recursive --force'
alias scp='sudo cp --interactive'
alias srm='sudo rm --interactive'
alias smv='sudo mv --interactive'
alias mkdir='mkdir --parents'
alias dot="cd ${DOTFILES}"
alias vfont="nvim ${XDG_CONFIG_HOME}/fontconfig/fonts.conf"
alias vwez="nvim ${XDG_CONFIG_HOME}/wezterm/wezterm.lua"
alias vmime="nvim ${XDG_CONFIG_HOME}/mimeapps.list"
alias vrofi="nvim ${XDG_CONFIG_HOME}/rofi/config.rasi"
alias vpicom="nvim ${XDG_CONFIG_HOME}/picom/picom.conf"
alias vzsh="cd ${XDG_CONFIG_HOME}/zsh > /dev/null && nvim . && cd ${HOME} > /dev/null"
alias vkitty="cd ${XDG_CONFIG_HOME}/kitty/conf.d > /dev/null && nvim . && cd ${HOME} > /dev/null"
alias vconf="cd ${XDG_CONFIG_HOME}/nvim/lua > /dev/null && nvim . && cd ${HOME} > /dev/null"
alias vala="cd ${XDG_CONFIG_HOME}/alacritty/conf.d > /dev/null && nvim . && cd ${HOME} > /dev/null"
alias vi3="cd ${XDG_CONFIG_HOME}/i3/conf.d > /dev/null && nvim . && cd ${HOME} > /dev/null"
alias vpolybar="cd ${XDG_CONFIG_HOME}/polybar/conf.d > /dev/null && nvim . && cd ${HOME} > /dev/null"
alias vranger="cd ${XDG_CONFIG_HOME}/ranger > /dev/null && nvim . && cd ${HOME} > /dev/null"
alias vdunst="cd ${XDG_CONFIG_HOME}/dunst/dunstrc.d > /dev/null && nvim . && cd ${HOME} > /dev/null"
alias vnorc='nvim -u NORC'
alias grep='grep --ignore-case --no-messages --color="auto" --binary-files="without-match" --exclude={.bash_history,.zsh_history,.*cache*,*cache*,.git,.z,.zcompdump,node_modules}'
alias dexec='docker compose exec'
alias drun='docker compose run --rm'
alias ddown='docker compose down'
alias dstop='docker compose stop'
alias dup='docker compose up --detach'
alias dlog='docker compose logs --follow'
alias dps='docker compose ps --all'
alias dbuild='docker compose build'
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'
alias gsw='git switch'
alias gco='git checkout'
alias grc='git reset'
alias gr='git restore'
alias gl='git log --oneline --graph'
alias gs='git status --short'
alias gf='git fetch'
alias gm='git merge'
alias gd='git diff'
alias gundoadd='git restore --staged'
alias gundocommit='git reset --soft HEAD^'
alias dockerprune='docker volume prune --force --all && docker system prune --force --all'
alias kf='kitty + list-fonts --psname'
alias kdf='kitty --debug-font-fallback'
alias sreload='sudo systemctl daemon-reload'
alias soff='sudo systemctl poweroff'
alias sre='sudo systemctl reboot'
alias ssp='sudo systemctl suspend'
alias sstatus='sudo systemctl status'
alias srestart='sudo systemctl restart'
alias sstart='sudo systemctl start'
alias sstop='sudo systemctl stop'
alias senable='sudo systemctl enable'
alias senablenow='sudo systemctl enable --now'
alias sdisable='sudo systemctl disable'
alias sdisablenow='sudo systemctl disable --now'
alias nreload='systemctl --user daemon-reload'
alias nstatus='systemctl --user status'
alias nrestart='systemctl --user restart'
alias nstart='systemctl --user start'
alias nstop='systemctl --user stop'
alias nenable='systemctl --user enable'
alias nenablenow='systemctl --user enable --now'
alias ndisable='systemctl --user disable'
alias ndisablenow='systemctl --user disable --now'
alias sz=". ${HOME}/.zshrc > /dev/null"
alias mpdstop='mpd --kill'
alias disklist='sudo fdisk --list'
alias renetwork='sudo systemctl restart systemd-{networkd,resolved}.service'
alias ipscan='sudo nmap -sP 192.168.1.0/24'
alias free='free --total --human'
alias df='df --print-type --human-readable'
alias sv='sudoedit'
alias pn='pnpm'
alias pnupdate='corepack prepare pnpm@latest --activate'
alias pnpkgupdate='pnpm add --global --save-prod @fsouza/prettierd eslint_d'
alias fontlist='fc-list | fzf'
alias t='tmux'
alias r='ranger'
alias homesize='du --summarize --block-size="1M" "${HOME}/"{*,.*} | sort --numeric-sort'
alias tmp="cd /tmp"
alias wmcn='xprop WM_{CLASS,NAME}'
alias nft='sudo nft'
alias ipt='sudo iptables'
alias ip6t='sudo ip6tables'
alias autosuspend='xautolock -time 60 -locker "sleep 31m" -killtime 30 -killer "systemctl suspend" &! ps aux | rg --invert-match "rg" | rg "xautolock"'
alias autosuspendoff='killall xautolock'
alias fd='fd --hidden --threads="$(("$(nproc)"+1))" --exclude={mnt,.cache,.git,/run/user}'
alias su-='sudo su -'
alias v='nvim'
alias v.='nvim .'
alias procstree='procs --tree'
alias rg='rg --threads="$(("$(nproc)"+1))"'
alias sbat='sudo bat --theme="Solarized (dark)"'
alias delta='delta --pager="less"'
alias so='source'
alias mirrorsync='sudo reflector --country="Japan" --age=24 --protocol="https" --sort="rate" --save="/etc/pacman.d/mirrorlist" && sudo pacman --sync --refresh --refresh'
alias pkglist="pacman --query --quiet --explicit --native > ${DOTFILES}/pkglist.txt && pacman --query --quiet --explicit > ${DOTFILES}/pkglist_aur.txt"
alias unrequired='pacman --query --unrequired --deps --quiet'
alias unrequiredclean='sudo pacman --remove --nosave --recursive "$(pacman --query --unrequired --deps --quiet)"'
alias cup='checkupdates'
alias psgrep='ps aux | rg --invert-match "rg" | rg'
alias reipt='sudo systemctl restart ip{,6}tables.service'
alias bcat='bat --style="plain" --paging="never"'
alias vmssh="ssh -i '${HOME}/.ssh/ed25519_vm' -p 52904"
alias dmesg='sudo dmesg --ctime --color="always" | bat --plain'
alias pkgi='paru --sync --removemake'

if type lsd &> /dev/null; then
  alias ls='lsd'
  alias ll='lsd --long --almost-all'
  alias la='lsd --almost-all'
  alias sl='lsd'
else
  alias ls='ls --color="auto"'
  alias ll='ls -l --almost-all --color="auto"'
  alias la='ls --almost-all --color="auto"'
  alias sl='ls --color="auto"'
fi

if [[ -n "${DISPLAY}" ]]; then
  alias b='bluetoothctl'
else
  alias x='startx'
fi

if [[ "${TERM}" == "xterm-kitty" ]]; then
  alias kittyssh='kitty +kitten ssh'
  alias c='printf "\e[H\e[3J"; la'
fi
