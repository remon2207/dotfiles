# zmodload  zsh/zprof

# Lines configured by zsh-newuser-install
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# keybind
bindkey -e

for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
  source "$conf"
done
unset conf

if [[ -n "$DISPLAY" ]]; then
  ### Added by Zinit's installer
  if [[ ! -f "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
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

  if [[  "$TERM" = "alacritty" ]]; then
    if [[ -z "$TMUX" ]] ;then
      ID="$( tmux ls 2> /dev/null | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
      if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
      else
        tmux attach-session -t "$ID" # if available attach to it
      fi
    fi
  fi

  zinit light Aloxaf/fzf-tab
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
  ### Added by Zinit's installer
  if [[ ! -f "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
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

  # configure prompt
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUPSTREAM=auto

  zinit light Aloxaf/fzf-tab
  zinit light zsh-users/zsh-syntax-highlighting
  zinit light zsh-users/zsh-autosuggestions
  zinit light zsh-users/zsh-completions
  zinit light rupa/z

  # load git-prompt
  source "/usr/share/git/completion/git-prompt.sh"

  setopt PROMPT_SUBST ; PS1='
%B%F{blue}%~%f%b %F{red}$(__git_ps1 "[%s]")%f
%# '
fi

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/nvm/init-nvm.sh

# if [[ -n "$DISPLAY" ]]; then
#     if type fish > /dev/null 2>&1; then
#         exec fish
#     fi
# fi

# zprof
