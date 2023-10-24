export PATH="$PATH:/opt:$HOME/go/bin"
export QT_QPA_PLATFORMTHEME='qt5ct'

if [[ -n "$DISPLAY" ]]; then
  export EDITOR='nvim'
  export VISUAL='nvim'
  export SUDO_EDITOR='nvim'
else
  export SUDO_EDITOR='vi'
  export EDITOR='vi'
  export VISUAL='vi'
  export BROWSER='w3m'
fi

export FZF_CTRL_T_COMMAND="fd --hidden -t f -E '.git' -E '.cache'"
export FZF_ALT_C_COMMAND="fd --hidden -t d -E '.git' -E '.cache'"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--height 40% --layout reverse --border --no-mouse \
--color bg+:#073642,spinner:#2aa198,hl:#268bd2 \
--color fg:#839496,header:#268bd2,info:#b58900,pointer:#2aa198 \
--color marker:#2aa198,fg+:#eee8d5,prompt:#b58900,hl+:#268bd2"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT='-c'

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export PAGER='bat'

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export GLFW_IM_MODULE='ibus'

export TMPDIR='/tmp'

export http_proxy='http://proxy.home:8080'
export https_proxy=$http_proxy

export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
