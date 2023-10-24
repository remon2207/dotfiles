HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# keybind
bindkey -e

for conf in "$HOME/.config/zsh/conf.d/"*.zsh; do
  source "$conf"
done
unset conf

if [[ -n "$DISPLAY" ]]; then

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

    setopt PROMPT_SUBST
    PS1='
%B%F{blue}%~%f%b %F{red}$(__git_ps1 "[%s]")%f
%# '
  fi
else
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

  setopt PROMPT_SUBST
  PS1='
%B%F{blue}%~%f%b %F{red}$(__git_ps1 "[%s]")%f
%# '
fi

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/nvm/init-nvm.sh

# load fish
if [[ -n $DISPLAY ]]; then
  if [[ $(ps --no-header -o comm) != 'fish' ]]; then
    if type fish &> /dev/null; then
      exec fish
    fi
  fi
fi
