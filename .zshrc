# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch notify
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

unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# 色を使用できるようにする
autoload -Uz colors
colors
# LS_COLORSを設定しておく
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# 補完強化
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''
# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true


# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=242,bold,underline"
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=242,underline"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6c6c6c"


# gitのカラー表示
git config --global color.ui auto
# Ctrl+Sを無効化
stty stop undef

# keybind
# vim like
bindkey -v
# コマンド履歴補完
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^K" history-beginning-search-backward-end
bindkey "^J" history-beginning-search-forward-end

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# alias
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lsla='ls -lahF $1'
alias tree='tree -laF $1'
alias sudo='sudo '
alias ls='lsd -lahF'
alias e='exit'
alias vim='nvim'
alias vimdiff='nvim -d'
alias rmf='rm -rf'
alias sysctl='sudo systemctl'

# plugin
fpath+=${ZDOTDIR:-~}/.zsh_functions
fpath=(path/to/zsh-completions/src $fpath)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
source /usr/share/nvm/init-nvm.sh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# gitプロンプト
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
if [[ ! -n $TMUX ]]; then
  tmux new-session
fi

export FZF_DEFAULT_OPTS="
    --height 90% --reverse --border
    --prompt='➜  ' --margin=0,1 --inline-info
    --tiebreak=index --no-mouse --filepath-word
    --bind='ctrl-w:backward-kill-word,ctrl-x:jump,down:preview-page-down'
    --bind='ctrl-z:ignore,ctrl-]:replace-query,up:preview-page-up'
    --bind='ctrl-a:toggle-all,?:toggle-preview'
"

export FZF_CTRL_T_COMMAND="fd --type f -H -E .git "
export FZF_CTRL_T_OPTS="
    --select-1 --exit-0
    --bind 'ctrl-l:execute(tmux splitw -h -- /usr/bin/nvim {})'
    --bind '>:reload($FZF_CTRL_T_COMMAND -H -E .git )'
    --bind '<:reload($FZF_CTRL_T_COMMAND)'
    --preview 'bat -r :100 --color=always --style=header,grid {}'"

eval "$(starship init zsh)"


export PATH="$PATH:$HOME/.local/bin"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
