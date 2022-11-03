#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

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
alias fontconf="cd ${HOME}/.config/fontconfig"
alias vimconf="cd ${HOME}/.config/nvim/lua"
alias polybarconf="cd ${HOME}/.config/polybar"
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

  if [[ -z "$TMUX" ]] ;then
    ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
      tmux new-session
    else
      tmux attach-session -t "$ID" # if available attach to it
      fi
    fi

    source /usr/share/fzf/key-bindings.bash
    source /usr/share/fzf/completion.bash
    source /usr/share/nvm/init-nvm.sh

    eval "$(starship init bash)"
  else
    alias x="startx"

    # プロンプトのオプション表示設定
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    GIT_PS1_SHOWSTASHSTATE=true
    GIT_PS1_SHOWUPSTREAM=auto

    source /usr/share/fzf/key-bindings.bash
    source /usr/share/fzf/completion.bash
    source /usr/share/nvm/init-nvm.sh

    # git-promptの読み込み
    # source "${HOME}/.zsh/git-prompt.sh"
    source "/usr/share/git/completion/git-prompt.sh"

    # プロンプト
    PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
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

if type fd > /dev/null 2>&1; then
  alias find="fd"
fi

if type ranger > /dev/null 2>&1; then
  alias r="ranger"
fi

if type lazydocker > /dev/null 2>&1; then
  alias lzd="lazydocker"
fi

if type fzf > /dev/null 2>&1; then
  alias repos="ghq list -p | fzf"
  alias repo='cd $(repos)'
fi

if type tldr > /dev/null 2>&1; then
  alias rman="tldr"
fi

if type tmux > /dev/null 2>&1; then
  alias t="tmux"
fi

if type sd > /dev/null 2>&1; then
  alias sed="sd"
fi

if type delta > /dev/null 2>&1; then
  alias diff="delta -n"
fi

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
  . /usr/share/bash-completion/bash_completion
