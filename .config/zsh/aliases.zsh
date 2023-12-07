alias j='jobs'
alias dc='cd'
alias e='exit'
alias :q='exit'
alias c='clear'
alias sudo='sudo '
alias rm='rm --recursive --force'
alias mkdir='mkdir --parents'
alias dot="cd ${DOTFILES}"
alias vfont="nvim ${XDG_CONFIG_HOME}/fontconfig/fonts.conf"
alias vwez="nvim ${XDG_CONFIG_HOME}/wezterm/wezterm.lua"
alias vmime="nvim ${XDG_CONFIG_HOME}/mimeapps.list"
alias vzsh="cd ${XDG_CONFIG_HOME}/zsh/conf.d && nvim ."
alias vkitty="cd ${XDG_CONFIG_HOME}/kitty/conf.d && nvim ."
alias vfish="cd ${XDG_CONFIG_HOME}/fish && nvim ."
alias vconf="cd ${XDG_CONFIG_HOME}/nvim/lua && nvim ."
alias vala="cd ${XDG_CONFIG_HOME}/alacritty/conf.d && nvim ."
alias vi3="cd ${XDG_CONFIG_HOME}/i3/conf.d && nvim ."
alias vnorc='nvim -u "NORC"'
alias vpolybar="nvim ${XDG_CONFIG_HOME}/polybar/config.ini"
alias vpicom="nvim ${XDG_CONFIG_HOME}/picom/picom.conf"
alias grep='grep --color="auto" --ignore-case'
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
alias gs='git status'
alias gf='git fetch'
alias gm='git merge'
alias gd='git diff'
alias undoadd='git restore --staged'
alias undocommit='git reset --soft "HEAD^"'
alias bghtop='nohup kitty --single-instance htop &> /dev/null &!'
alias dockerprune='docker volume prune --force --all && docker system prune --force --all'
alias psa='ps -A --format="user,pid,%cpu,%mem,command"'
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
alias disklist='sudo fdisk --list'
alias setkeyrepeat='xset r rate 250 60'
alias resetkeyrepeat='xset r rate'
alias renetwork='sudo systemctl restart systemd-{networkd,resolved}.service'
alias ipscan='sudo nmap -sP 192.168.1.0/24'
alias free='free --total --human'
alias df='df --print-type --human-readable'
alias sv='sudoedit'
alias pn='pnpm'
alias pnupdate='corepack prepare pnpm@latest --activate'
alias pnpkgupdate='pnpm add --global --save-prod @fsouza/prettierd eslint_d'
alias repo='cd "$(ghq list --full-path | fzf)"'
alias reporm='rm "$(ghq list --full-path | fzf)"'
alias fontlist='fc-list | fzf | awk --field-separator="[:,]" "{print \$2}" | cut --delimiter=" " --fields="2-"'
alias t='tmux'
alias rg='rg --ignore-case --no-line-number'
alias r='ranger'
alias less='less --LONG-PROMPT --LINE-NUMBERS --RAW-CONTROL-CHARS --ignore-case --quit-if-one-screen --tabs=4'
alias homesize='du --summarize --block-size="1M" "${HOME}/"{*,.*} | sort --numeric-sort'
alias tmp="cd ${HOME}/tmp"
alias wmclassname='xprop WM_CLASS WM_NAME'
alias nft='sudo nft'
alias ipt='sudo iptables'
alias ip6t='sudo ip6tables'
alias autosuspend='nohup xautolock -time 60 -locker "systemctl suspend" &> /dev/null &! procs xautolock'
alias autosuspendoff='killall "xautolock"'
alias fd='fd --hidden --exclude="mnt" --exclude=".cache" --exclude=".git" --exclude="ccache"'
alias su-='sudo su -'
alias kernelbuild='sudo bash -c "make --jobs=13 --load-average=26.0 && make modules_install; make install"'
alias v='nvim'
alias v.='nvim .'
alias wget='wget --no-hsts'
alias procs="procs --load-config='${XDG_CONFIG_HOME}/procs/config.toml'"
alias http='http --body --style="solarized" --format-options="json.indent:2"'

case "${distribution_name}" in
'Arch Linux')
  alias mirrorsync='sudo reflector --country="Japan" --age=24 --protocol="https" --sort="rate" --save="/etc/pacman.d/mirrorlist" && sudo pacman -Syy'
  alias unrequired='pacman -Qtdq'
  alias pacclean='sudo pacman -Rns "$(pacman -Qtdq)"'
  alias pkglist="pacman -Qqen > ${DOTFILES}/pkglist"
  alias pkglistaur="pacman -Qqe > ${DOTFILES}/pkglist_aur"
  alias nobuildtemp='sudo sd "^#(BUILDDIR)" "\$1" /etc/makepkg.conf'
  alias buildtemp='sudo sd "^(BUILDDIR)" "#\$1" /etc/makepkg.conf'
  ;;
'Gentoo Linux')
  alias pkgclean='sudo emerge --ask --depclean'
  alias portageupgrade='sudo emerge --ask --verbose --oneshot sys-apps/portage'
  alias showpkgsuse='emerge --pretend --verbose --emptytree @world'
  ;;
esac

if type lsd &> /dev/null; then
  alias ls='lsd'
  alias ll='lsd --long --almost-all --classify --ignore-glob=".{cache,git}"'
  alias la='lsd --almost-all --classify --ignore-glob=".{cache,git}"'
  alias sl='lsd'
else
  alias ls='ls --color="auto"'
  alias ll='ls -l --almost-all --classify --color="auto" --ignore=".{cache,git}"'
  alias la='ls --almost-all --classify --color="auto" --ignore=".{cache,git}"'
  alias sl='ls --color="auto"'
fi

if [[ -n "${DISPLAY}" ]]; then
  alias b='bluetoothctl'
else
  alias x='startx'
fi

if [[ "${TERM}" == "xterm-kitty" ]]; then
  alias kittyssh='kitty +kitten ssh'
  alias c='printf "\e[H\e[3J"'
fi
