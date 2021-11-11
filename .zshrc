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
zstyle :compinstall filename '/home/remon/.zshrc'

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

# gitのカラー表示
git config --global color.ui auto
# Ctrl+Sを無効化
stty stop undef

# keybind
# vim like
bindkey -d
bindkey -v

# bindkey -r ""
bindkey -r "^V"
# コマンド履歴補完
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

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
function zle-line-init zle-keymap-select {
    VIM_NORMAL="%F{208}⮀ % NORMAL ⮀%f"
    VIM_INSERT="%F{075}⮀ % INSERT ⮀%f"
    RPS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# PROMPT=$'%F{%(#.blue.green)}┌── ${debian_chroot:+($debian_chroot)─}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))─}(%B%F{%(#.red.blue)}%n$prompt_symbol%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}] `rprompt-git-current-branch`%f\n%F{%(#.blue.green)}└─%B%(#.%F{red}#.%F{blue} %#)%b%F{reset} '

# PROMPT='
# %F{green}┌─ (%f%F{blue}%B%n@%m%b%f%F{green}%b)-[%f%F{white}%B%~%b%f%F{green}]%f `rprompt-git-current-branch`
# %F{green}└─ %f%F{blue}%#%f '
# RPROMPT=$'%(?.. %? %F{red}%B⨯%b%F{reset})%(1j. %j %F{yellow}%B⚙%b%F{reset}.)  (%*)'
# RPROMPT='%W%*'
RPROMPT=''

# alias
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lsla='ls -lahF'
alias sudo='sudo '
alias vim='~/appimage/nvim.appimage'
alias ls='lsd -la'
alias e='exit'
alias vimdiff='vim -d'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gc-m='git commit -m'
alias gp='git push'
alias rmf='rm -rf'
# plugin
fpath+=${ZDOTDIR:-~}/.zsh_functions
fpath=(path/to/zsh-completions/src $fpath)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh

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

if [[ ${TERM} != "linux" ]]; then
    function powerline_precmd() {
        PS1="
$(powerline-go -error $? -newline -modules venv,user,host,ssh,cwd,perms,git,hg,jobs,exit)"
    }



    function install_powerline_precmd() {
        for s in "${precmd_functions[@]}"; do
            if [ "$s" = "powerline_precmd" ]; then
                return
            fi
        done
        precmd_functions+=(powerline_precmd)
    }

    install_powerline_precmd
fi

# tmux/screenの自動起動設定
#  Note: .bashrc or .zshrc に設定して使用して下さい。
#
#  ログイン時にtmux または screenが起動してない場合は自動的に起動
#  デタッチ済みセッションが存在すればアタッチし、なければ新規セッションを生成
#  tmuxを優先して起動し、tmuxが使えなければscreenを起動する
#
if [ -z "$TMUX" -a -z "$STY" ]; then
    if type tmuxx >/dev/null 2>&1; then
        tmuxx
    elif type tmux >/dev/null 2>&1; then
        if tmux has-session && tmux list-sessions | egrep -q '.*]$'; then
            # デタッチ済みセッションが存在する
            tmux attach && echo "tmux attached session "
        else
            tmux new-session && echo "tmux created new session"
        fi
    elif type screen >/dev/null 2>&1; then
        screen -rx || screen -D -RR
    fi
fi
source /usr/share/nvm/init-nvm.sh
