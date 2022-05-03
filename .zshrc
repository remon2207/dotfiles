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

# prompt
# git ブランチ名を色付きで表示させるメソッド
# function rprompt-git-current-branch {
#   local branch_name st branch_status
 
#   if [ ! -e  ".git" ]; then
#     # git 管理されていないディレクトリは何も返さない
#     return
#   fi
#   branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
#   st=`git status 2> /dev/null`
#   if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
#     # 全て commit されてクリーンな状態
#     branch_status="%F{green}"
#   elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
#     # git 管理されていないファイルがある状態
#     branch_status="%F{red}?"
#   elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
#     # git add されていないファイルがある状態
#     branch_status="%F{red}+"
#   elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
#     # git commit されていないファイルがある状態
#     branch_status="%F{yellow}!"
#   elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
#     # コンフリクトが起こった状態
#     echo "%F{red}!(no branch)"
#     return
#   else
#     # 上記以外の状態の場合
#     branch_status="%F{blue}"
#   fi
#   # ブランチ名を色付きで表示する
#   echo "${branch_status}[$branch_name]"
# }
 
# # プロンプトが表示されるたびにプロンプト文字列を評価、置換する
# setopt prompt_subst

# vimのインサートモードとノーマルモードを表示
# function zle-line-init zle-keymap-select {
#     VIM_NORMAL="%F{208}⮀ % NORMAL ⮀%f"
#     VIM_INSERT="%F{075}⮀ % INSERT ⮀%f"
#     RPS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
#     RPS2=$RPS1
#     zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select


# git-promptの読み込み
# source ~/.zsh/git-prompt.sh

# # git-completionの読み込み
# fpath=(~/.zsh $fpath)
# zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
# autoload -Uz compinit && compinit

# # プロンプトの表示設定(好きなようにカスタマイズ可)
# setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
# \$ '




# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# プロンプトカスタマイズ
# PROMPT='
# %F{white}%B[%~]%b%f %F{cyan}$vcs_info_msg_0_%f
#  %F{blue}%B>%b%f '
 RPROMPT=''



# PROMPT=$'%F{%(#.blue.green)}┌── ${debian_chroot:+($debian_chroot)─}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))─}(%B%F{%(#.red.blue)}%n$prompt_symbol%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}] `rprompt-git-current-branch`%f\n%F{%(#.blue.green)}└─%B%(#.%F{red}#.%F{blue} %#)%b%F{reset} '

# PROMPT='
# %F{green}┌─  %f%F{white}%B%~%b
# %F{green}└─ %f%F{blue}>%f '
# # RPROMPT=$'%(?.. %? %F{red}%B⨯%b%F{reset})%(1j. %j %F{yellow}%B⚙%b%F{reset}.)  (%*)'
# RPROMPT='%*'
# RPROMPT=''

# alias
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lsla='ls -lahF'
alias sudo='sudo '
# alias vim='~/appimage/nvim.appimage'
alias ls='lsd -la'
alias e='exit'
alias vim='nvim'
alias vimdiff='nvim -d'
alias rmf='rm -rf'
alias sysctl='sudo systemctl'

# plugin
fpath+=${ZDOTDIR:-~}/.zsh_functions
fpath=(path/to/zsh-completions/src $fpath)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
source /usr/share/nvm/init-nvm.sh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source ~/.zplug/init.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zplug "dracula/zsh", as:theme


# gitプロンプト
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# powerline
#function powerline_precmd() {
#    PS1="$(powerline-shell --shell zsh $?)"
#}

#function install_powerline_precmd() {
#  for s in "${precmd_functions[@]}"; do
#    if [ "$s" = "powerline_precmd" ]; then
#      return
#    fi
#  done
#  precmd_functions+=(powerline_precmd)
#}

#if [ "$TERM" != "linux" ]; then
#    install_powerline_precmd
#fi

# if [[ ${TERM} != "linux" ]]; then
#     function powerline_precmd() {
#         # PS1="$(powerline-go -error $? -newline -modules venv,user,host,ssh,cwd,perms,git,hg,jobs,exit)"
#         PS1="
# $(powerline-go -error $? -newline -modules venv,ssh,cwd,perms,git,hg,jobs,exit)"
#         # eval "$(powerline-go -error $? -eval -newline -modules venv,ssh,cwd,perms,git,hg,jobs,exit -modules-right time)"
#          # eval "$($GOPATH/bin/powerline-go -error $? -shell zsh -eval -newline -modules 'venv,cwd,perms,git,jobs,exit,root,vgo' -modules-right 'git')"
#     }
#     function install_powerline_precmd() {
#         for s in "${precmd_functions[@]}"; do
#             if [ "$s" = "powerline_precmd" ]; then
#                 return
#             fi
#         done
#         precmd_functions+=(powerline_precmd)
#     }

#     install_powerline_precmd
# fi

# tmux/screenの自動起動設定
#  Note: .bashrc or .zshrc に設定して使用して下さい。
#
#  ログイン時にtmux または screenが起動してない場合は自動的に起動
#  デタッチ済みセッションが存在すればアタッチし、なければ新規セッションを生成
#  tmuxを優先して起動し、tmuxが使えなければscreenを起動する
#
# if [ -z "$TMUX" -a -z "$STY" ]; then
#     if type tmuxx >/dev/null 2>&1; then
#         tmuxx
#     elif type tmux >/dev/null 2>&1; then
#         if tmux has-session && tmux list-sessions | egrep -q '.*]$'; then
#             # デタッチ済みセッションが存在する
#             tmux attach && echo "tmux attached session "
#         else
#             tmux new-session && echo "tmux created new session"
#         fi
#     elif type screen >/dev/null 2>&1; then
#         screen -rx || screen -D -RR
#     fi
# fi

if [[ ! -n $TMUX ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux new-session
  fi
  create_new_session="Create New Session"
  ID="$ID\n${create_new_session}:"
  ID="`echo $ID | $PERCOL | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID"
  else
    :  # Start terminal normally
  fi
fi

# peco
# Ctrl+rでpeco呼び出す
# function peco-history-selection() {
#     BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
#     CURSOR=$#BUFFER
#     zle reset-prompt
# }

# zle -N peco-history-selection
# bindkey '^R' peco-history-selection

# cdr
# if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
#     autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
#     add-zsh-hook chpwd chpwd_recent_dirs
#     zstyle ':completion:*' recent-dirs-insert both
#     zstyle ':chpwd:*' recent-dirs-default true
#     zstyle ':chpwd:*' recent-dirs-max 1000
#     zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
# fi

# function peco-cdr () {
#     local selected_dir="$(cdr -l | sed 's/^[0-9]\+ \+//' | peco --prompt="cdr >" --query "$LBUFFER")"
#     if [ -n "$selected_dir" ]; then
#         BUFFER="cd ${selected_dir}"
#         zle accept-line
#     fi
# }
# zle -N peco-cdr
# bindkey '^E' peco-cdr

# fzf-cdr 
# alias cdd='fzf-cdr'
# function fzf-cdr() {
#     target_dir=`cdr -l | sed 's/^[^ ][^ ]*  *//' | fzf`
#     target_dir=`echo ${target_dir/\~/$HOME}`
#     if [ -n "$target_dir" ]; then
#         cd $target_dir
#     fi
# }


export FZF_DEFAULT_OPTS="
    --height 90% --reverse --border
    --prompt='➜  ' --margin=0,1 --inline-info
    --tiebreak=index --no-mouse --filepath-word
    --color fg:#f8f8f2,bg:#282a36,hl:#bd93f9
    --color fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
    --color info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
    --color marker:#ff79c6,spinner:#ffb86c,header:#6272a4
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

# export FZF_CTRL_T_COMMAND="fd --type f "
# export FZF_CTRL_T_OPTS="
#     --select-1 --exit-0
#     --bind 'ctrl-l:execute(tmux splitw -h -- $HOME/appimage/nvim.appimage {})'
#     --bind '>:reload($FZF_CTRL_T_COMMAND -H -E .git )'
#     --bind '<:reload($FZF_CTRL_T_COMMAND)'
#     --preview 'bat -r :100 --color=always --style=header,grid {}'"

eval "$(starship init zsh)"


export PATH="$PATH:$HOME/.local/bin"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
