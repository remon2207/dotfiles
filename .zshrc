# zmodload  zsh/zprof

# Lines configured by zsh-newuser-install
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt extendedglob nomatch notify
# Japanese language support
setopt print_eight_bit
# TAB completion
setopt auto_pushd
# move directory without cd command
setopt auto_cd
# share history
setopt share_history
# If same as last time not add
setopt hist_ignore_dups
# not add duplication
setopt hist_ignore_all_dups
# ignore space
setopt hist_ignore_space
# extra space is reduce
setopt hist_reduce_blanks
# Correct spelling of commands
setopt correct
# If directory already in stack not add
setopt pushd_ignore_dups

setopt no_flow_control

# unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ''

# keybind
# bindkey -e
bindkey -v

alias j="jobs"
alias dc="cd"
alias e="exit"
alias :q="exit"
alias c="clear"
alias sudo="sudo "
alias rm="rm -rf"
alias ls="ls --color=auto"
alias ll="ls -alF"
alias la="ls -A"
alias sl="ls"
alias mkdir="mkdir -p"
alias cfont="cd ${HOME}/.config/fontconfig"
alias fontconf="cd ${HOME}/.config/fontconfig && /usr/bin/nvim fonts.conf"
alias cvim="cd ${HOME}/.config/nvim/lua"
alias vimconf="cd ${HOME}/.config/nvim/lua && /usr/bin/nvim ."
alias cpolybar="cd ${HOME}/.config/polybar"
alias polybarconf="cd ${HOME}/.config/polybar && /usr/bin/nvim config.ini"
alias cpicom="cd ${HOME}/.config/picom"
alias picomconf="cd ${HOME}/.config/picom && /usr/bin/nvim picom.conf"
alias grep="grep --color=auto"
alias dexec="docker compose exec"
alias drun="docker compose run --rm"
alias ddown="docker compose down"
alias dup="docker compose up -d"
alias dlogs="docker compose logs -f"
alias dps="docker compose ps -a"
alias dbuild="docker compose build"
alias g="git"
alias glog="git log --oneline --graph"
alias repoinit='echo "# $(basename $(pwd))" > README.md && git add . && git commit -m "Initial commit" && git push -u origin main'

mkcd() {
    mkdir -p ${1} && cd ${1}
}

if [[ -n ${DISPLAY} ]]; then
    # aliases

    if type lsd > /dev/null 2>&1; then
        alias ls="lsd --color=auto"
        alias ll="lsd -alF --color=auto"
        alias la="lsd -A --color=auto"
    else
        alias ls="ls --color=auto"
        alias ll="ls -alF --color=auto"
        alias la="ls -A --color=auto"
    fi

    if type nvim > /dev/null 2>&1; then
        alias vim="nvim"
    fi

    alias killstartup="killall Discord slack"
    alias b="bluetoothctl"

    ### Added by Zinit's installer
    if [[ ! -f ${HOME}/.local/share/zinit/zinit.git/zinit.zsh ]]; then
        print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
        command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
        command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
            print -P "%F{33} %F{34}Installation successful.%f%b" || \
            print -P "%F{160} The clone has failed.%f%b"
    fi

    source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit
    ### End of Zinit's installer chunk

    if [[  ${TERM} = "alacritty" ]]; then
        if [[ -z "$TMUX" ]] ;then
            ID="$( tmux ls 2> /dev/null | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
            if [[ -z "$ID" ]] ;then # if not available create a new one
                tmux new-session
            else
                tmux attach-session -t "$ID" # if available attach to it
            fi
        fi
    fi

    zinit light zsh-users/zsh-syntax-highlighting
    zinit light zsh-users/zsh-autosuggestions
    zinit light zsh-users/zsh-completions
    zinit light rupa/z

    # solarized
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"

    if type starship > /dev/null 2>&1; then
        eval "$(starship init zsh)"
    else
        # configure prompt
        GIT_PS1_SHOWDIRTYSTATE=true
        GIT_PS1_SHOWUNTRACKEDFILES=true
        GIT_PS1_SHOWSTASHSTATE=true
        GIT_PS1_SHOWUPSTREAM=auto

        zinit light zsh-users/zsh-syntax-highlighting
        zinit light zsh-users/zsh-autosuggestions

        # load git-prompt
        source "/usr/share/git/completion/git-prompt.sh"

        setopt PROMPT_SUBST ; PS1='
%B%F{blue}%~%f%b %F{red}$(__git_ps1 "[%s]")%f
%# '
    fi
else
    alias x="startx"

    ### Added by Zinit's installer
    if [[ ! -f ${HOME}/.local/share/zinit/zinit.git/zinit.zsh ]]; then
        print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
        command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
        command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
            print -P "%F{33} %F{34}Installation successful.%f%b" || \
            print -P "%F{160} The clone has failed.%f%b"
    fi

    source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit
    ### End of Zinit's installer chunk

    # configure prompt
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    GIT_PS1_SHOWSTASHSTATE=true
    GIT_PS1_SHOWUPSTREAM=auto

    zinit light zsh-users/zsh-syntax-highlighting
    zinit light zsh-users/zsh-autosuggestions

    # load git-prompt
    source "/usr/share/git/completion/git-prompt.sh"

    setopt PROMPT_SUBST ; PS1='
%B%F{blue}%~%f%b %F{red}$(__git_ps1 "[%s]")%f
%# '
fi

# common aliases
if type fd > /dev/null 2>&1; then
    alias find="fd"
fi

if type lazydocker > /dev/null 2>&1; then
    alias lzd="lazydocker"
fi

if type fzf > /dev/null 2>&1; then
    alias repos="ghq list -p | fzf"
    alias repo='cd $(repos)'
    alias fontlist="fc-list | fzf"
fi

if type tmux > /dev/null 2>&1; then
    alias t="tmux"
fi

if type rg > /dev/null 2>&1; then
    alias grep="rg --color=auto"
else
    alias grep="grep --color=auto"
fi

if type bat > /dev/null 2>&1; then
    alias cat="bat"
fi

if type ranger > /dev/null 2>&1; then
    alias r="ranger"
fi

if type tldr > /dev/null 2>&1; then
    alias rman="tldr"
fi

if type sd > /dev/null 2>&1; then
    alias sed="sd"
fi

if type delta > /dev/null 2>&1; then
    alias diff="delta -n"
fi

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/nvm/init-nvm.sh

# if [[ -n ${DISPLAY} ]]; then
#     if type fish > /dev/null 2>&1; then
#         exec fish
#     fi
# fi

# zprof
