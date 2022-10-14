# Lines configured by zsh-newuser-install
HISTFILE="${HOME}/.histfile"
HISTSIZE=10000
SAVEHIST=10000
setopt extendedglob nomatch notify
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# cd [TAB] で以前移動したディレクトリを表示
setopt auto_pushd
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# 直前と同じコマンドの場合はヒストリに追加しない
setopt hist_ignore_dups
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# コマンドのスペルを訂正する
setopt correct
# pushdしたとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
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

if [[ ${DISPLAY} = ":0" ]]; then
    # aliases

    if type lsd > /dev/null; then
        alias ls="lsd --color always"
        alias ll="lsd -alF --color always"
        alias la="lsd -A --color always"
    else
        alias ls="ls --color always"
        alias ll="ls -alF --color always"
        alias la="ls -A --color always"
    fi

    if type nvim > /dev/null; then
        alias vim="nvim"
    fi

    if type rg > /dev/null; then
        alias grep="rg --color always"
    else
        alias grep="grep --color always"
    fi

    if type bat > /dev/null; then
        alias cat="bat"
    fi

    if type fd > /dev/null; then
        alias find="fd"
    fi

    if type ranger > /dev/null; then
        alias r="ranger"
    fi

    if type lazydocker > /dev/null; then
        alias lzd="lazydocker"
    fi

    if type fzf > /dev/null; then
        alias repos="ghq list -p | fzf"
        alias repo='cd $(repos)'
    fi
    if type tldr > /dev/null; then
        alias man="tldr"
    fi
    if type tmux > /dev/null; then
        alias t="tmux"
    fi

    alias dc="cd"
    alias e="exit"
    alias :q="exit"
    alias c="clear"
    alias sudo="sudo "
    alias rm="rm -rf"
    alias less="less -R"
    alias x="startx"
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

    if [[ -z "$TMUX" ]] ;then
        ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
        if [[ -z "$ID" ]] ;then # if not available create a new one
            tmux new-session
        else
            tmux attach-session -t "$ID" # if available attach to it
        fi
    fi

    zinit light zsh-users/zsh-syntax-highlighting
    zinit light zsh-users/zsh-autosuggestions

    # solarized
    # ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#555"
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"

    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
    source /usr/share/nvm/init-nvm.sh

    eval "$(starship init zsh)"
else
    if type fd > /dev/null; then
        alias find="fd"
    fi
    if type lazydocker > /dev/null; then
        alias lzd="lazydocker"
    fi
    if type fzf > /dev/null; then
        alias repos="ghq list -p | fzf"
        alias repo='cd $(repos)'
    fi
    if type tldr > /dev/null; then
        alias man="tldr"
    fi
    if type tmux > /dev/null; then
        alias t="tmux"
    fi

    alias dc="cd"
    alias ls="ls --color always"
    alias ll="ls -alF"
    alias la="ls -A"
    alias grep="grep --color always"
    alias e="exit"
    alias :q="exit"
    alias c="clear"
    alias sudo="sudo "
    alias rm="rm -rf"
    alias less="less -R"
    alias x="startx"
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

    # プロンプトのオプション表示設定
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    GIT_PS1_SHOWSTASHSTATE=true
    GIT_PS1_SHOWUPSTREAM=auto

    zinit light zsh-users/zsh-syntax-highlighting
    zinit light zsh-users/zsh-autosuggestions

    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
    source /usr/share/nvm/init-nvm.sh

    # git-promptの読み込み
    source "${HOME}/.zsh/git-prompt.sh"

    # プロンプト
    # PROMPT='%B%F{blue}%~%f%b'
    # setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
    # \$ '
    setopt PROMPT_SUBST ; PS1='
%B%F{blue}%~%f%b %F{red}$(__git_ps1 "[%s]")%f
%# '
fi
