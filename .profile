export PATH="${HOME}/bin:${HOME}/go/bin:${HOME}/.cargo/bin:${HOME}/.local/share/pnpm:/opt:${PATH}"
export QT_QPA_PLATFORMTHEME='qt5ct'
export TERMINAL='/usr/bin/kitty'
export PAGER='/usr/bin/bat'
export MANPAGER='/bin/sh -c "/usr/bin/col --no-backspaces --spaces | /usr/bin/bat --language="man" --plain"'
export MANROFFOPT='-c'
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export LESSHISTFILE='/dev/null'
export RIPGREP_CONFIG_PATH="${HOME}/.ripgreprc"
export TMPDIR='/tmp'
export LESS='--LONG-PROMPT --RAW-CONTROL-CHARS --ignore-case --quit-if-one-screen --tabs=4'
export HIGHLIGHT_STYLE='solarized-dark'
export PS_FORMAT='pid,user,%cpu,%mem,command'
export PNPM_HOME="${HOME}/.local/share/pnpm"
export NVM_DIR="${HOME}/.config/nvm"
export NODE_REPL_HISTORY="${XDG_CACHE_HOME}/node_repl_history"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME}/nv/ComputeCache"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"
export FZF_CTRL_T_COMMAND='/usr/bin/fd --hidden --type="file" --exclude=".{git,cache}"'
export FZF_ALT_C_COMMAND='/usr/bin/fd --hidden --type="directory" --exclude=".{git,cache}"'
export FZF_DEFAULT_OPTS="\
--height='40%' --layout='reverse' --no-mouse \
--color='bg+:#073642,spinner:#2aa198,hl:#268bd2' \
--color='fg:#839496,header:#268bd2,info:#b58900,pointer:#2aa198' \
--color='marker:#2aa198,fg+:#eee8d5,prompt:#b58900,hl+:#268bd2'"

if [[ "$(rg '^DNS' /etc/systemd/network/20-wired.network)" == 'DNS=192.168.1.202' ]]; then
  export http_proxy='http://proxy.home:8080'
  export https_proxy="${http_proxy}"
  export ftp_proxy="${http_proxy}"
  export RSYNC_PROXY="${http_proxy}"
fi

if [[ "$(uname -a | awk '{print $2}')" != 'gentoo' ]]; then
  if [[ -n "${DISPLAY}" ]]; then
    export EDITOR='/usr/bin/nvim'
    export VISUAL='/usr/bin/nvim'
    export SUDO_EDITOR='/usr/bin/nvim'
    export SYSTEMD_EDITOR='/usr/bin/nvim'
  else
    export EDITOR='/usr/bin/vi'
    export VISUAL='/usr/bin/vi'
    export SUDO_EDITOR='/usr/bin/vi'
    export SYSTEMD_EDITOR='/usr/bin/vi'
  fi
fi
