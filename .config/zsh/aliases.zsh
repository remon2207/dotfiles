alias j='jobs'
alias dc='cd'
alias e='exit'
alias :q='exit'
alias c='clear; la'
alias sudo='sudo '
alias rm='rm --recursive --force'
alias mkdir='mkdir --parents'
alias dot="cd ${DOTFILES}"
alias vfont="nvim ${XDG_CONFIG_HOME}/fontconfig/fonts.conf"
alias vwez="nvim ${XDG_CONFIG_HOME}/wezterm/wezterm.lua"
alias vmime="nvim ${XDG_CONFIG_HOME}/mimeapps.list"
alias vzsh="cd ${XDG_CONFIG_HOME}/zsh && nvim ."
alias vkitty="cd ${XDG_CONFIG_HOME}/kitty/conf.d && nvim ."
alias vfish="cd ${XDG_CONFIG_HOME}/fish && nvim ."
alias vconf="cd ${XDG_CONFIG_HOME}/nvim/lua && nvim ."
alias vala="cd ${XDG_CONFIG_HOME}/alacritty/conf.d && nvim ."
alias vi3="cd ${XDG_CONFIG_HOME}/i3/conf.d && nvim ."
alias vnorc='nvim -u "NORC"'
alias vpolybar="cd ${XDG_CONFIG_HOME}/polybar/conf.d && nvim ."
alias vpicom="nvim ${XDG_CONFIG_HOME}/picom/picom.conf"
alias grep='grep --ignore-case --no-messages --color="auto" --recursive --binary-files="without-match" --exclude={.bash_history,.zsh_history,.*cache*,*cache*,.git,.z,.zcompdump,node_modules}'
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
alias gundocommit='git reset --soft "HEAD^"'
alias gedit="git status --short | fzf | awk '{print \$2}' | xargs nvim"
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
alias sz=". ${HOME}/.zshrc &> /dev/null"
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
alias fontlist='fc-list | fzf | awk --field-separator="[:,]" "{print \$2}" | cut --delimiter=" " --fields="2-"'
alias t='tmux'
alias r='ranger'
alias homesize='du --summarize --block-size="1M" "${HOME}/"{*,.*} | sort --numeric-sort'
alias tmp="cd ${HOME}/tmp"
alias wmclassname='xprop WM_{CLASS,NAME}'
alias nft='sudo nft'
alias ipt='sudo iptables'
alias ip6t='sudo ip6tables'
alias autosuspend='nohup xautolock -time 60 -locker "sleep 31m" -killtime 30 -killer "systemctl suspend" &> /dev/null &! procs xautolock'
alias autosuspendoff='killall "xautolock"'
alias fd='fd --hidden --threads="$(("$(nproc)"+1))" --exclude={mnt,.cache,.git,ccache}'
alias su-='sudo su -'
alias kernelbuild='sudo make --jobs="$(("$(nproc)"+1))" --load-average="$((("$(nproc)"+1)*2)).0" && sudo make modules_install; sudo make install'
alias v='nvim'
alias v.='nvim .'
alias procstree='procs --tree'
alias rg='rg --threads="$(("$(nproc)"+1))"'
alias versioncheck="bat --plain /etc/os-release | awk --field-separator='\"' 'END {print}'; uname --kernel-release | sd '^([0-9].*)-.*$' 'KERNEL_VERSION=\"\$1\"'"

case "${DISTRIBUTION_NAME}" in
'archlinux')
  alias mirrorsync='sudo reflector --country="Japan" --age=24 --protocol="https" --sort="rate" --save="/etc/pacman.d/mirrorlist" && sudo pacman --sync --refresh --refresh'
  alias unrequired='pacman --query --unrequired --deps --quiet'
  alias pacclean='sudo pacman --remove --nosave --recursive "$(pacman --query --unrequired --deps --quiet)"'
  alias pkglist="pacman --query --quiet --explicit --native > ${DOTFILES}/pkglist"
  alias pkglistaur="pacman --query --quiet --explicit > ${DOTFILES}/pkglist_aur"
  alias nobuildtemp='sudo sd "^#(BUILDDIR)" "\$1" /etc/makepkg.conf'
  alias buildtemp='sudo sd "^(BUILDDIR)" "#\$1" /etc/makepkg.conf'
  ;;
'gentoo')
  alias pkgclean='sudo emerge --ask --verbose="n" --depclean'
  alias portageupgrade='sudo emerge --ask --oneshot sys-apps/portage'
  alias showpkgsuse='emerge --pretend --emptytree @world'
  ;;
esac

if type lsd &> /dev/null; then
  alias ls='lsd --ignore-glob="lost+found"'
  alias ll='lsd --long --almost-all --classify --ignore-glob=".{cache,git}" --ignore-glob="lost+found"'
  alias la='lsd --almost-all --classify --ignore-glob=".{cache,git}" --ignore-glob="lost+found"'
  alias sl='lsd --ignore-glob="lost+found"'
else
  alias ls='ls --color="auto" --ignore="lost+found"'
  alias ll='ls -l --almost-all --classify --color="auto" --ignore=".{cache,git}" --ignore="lost+found"'
  alias la='ls --almost-all --classify --color="auto" --ignore=".{cache,git}" --ignore="lost+found"'
  alias sl='ls --color="auto" --ignore="lost+found"'
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
