# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
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
# setopt correct
# pushdしたとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# keybind
bindkey -e

# alias
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias vim='nvim'
alias repos='ghq list -p | fzf'
alias repo='cd $(repos)'
alias dexec='docker-compose exec'
alias drun='docker-compose run --rm'
alias ddown='docker-compose down'
alias dup='docker-compose up -d'
alias dlog='docker-compose logs -f'
alias dps='docker-compose ps -a'
alias dbuild='docker-compose build'

if [[ ! -n $TMUX ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux new-session
  fi
  create_new_session="Create New Session"
  ID="$ID\n${create_new_session}:"
  ID="`echo $ID | fzf | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID"
  else
    :  # Start terminal normally
  fi
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

eval "$(starship init zsh)"

export PATH="$PATH:$HOME/.local/bin"
export EDITOR="/usr/bin/nvim"
export FZF_DEFAULT_OPTS='--no-mouse'
export FZF_CTRL_T_OPTS='--preview "bat --color=always --style=header,grid {}"'
export FZF_CTRL_T_COMMAND='fd --type f --hidden --exclude .git'

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/nvm/init-nvm.sh
