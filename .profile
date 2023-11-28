export PATH="${HOME}/go/bin:${HOME}/.cargo/bin:${HOME}/.local/share/pnpm:/opt:${PATH}"
export QT_QPA_PLATFORMTHEME='qt5ct'

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

export FZF_CTRL_T_COMMAND='/usr/bin/fd -H -t f -E ".git" -E ".cache"'
export FZF_ALT_C_COMMAND='/usr/bin/fd -H -t d -E ".git" -E ".cache"'
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} \
--height 40% --layout reverse --no-mouse \
--color bg+:#073642,spinner:#2aa198,hl:#268bd2 \
--color fg:#839496,header:#268bd2,info:#b58900,pointer:#2aa198 \
--color marker:#2aa198,fg+:#eee8d5,prompt:#b58900,hl+:#268bd2"

export PAGER='/usr/bin/bat'
export MANPAGER='/bin/sh -c "col -bx | /usr/bin/bat -l man -p"'
export BAT_PAGER='/usr/bin/less -RFI'
export MANROFFOPT='-c'

export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

export GLFW_IM_MODULE='ibus'

export LESSHISTFILE='/dev/null'

export TMPDIR='/tmp'

if [[ "$(rg '^DNS' /etc/systemd/network/20-wired.network)" == 'DNS=192.168.1.202' ]]; then
  export http_proxy='http://proxy.home:8080'
  export https_proxy="${http_proxy}"
  export ftp_proxy="${http_proxy}"
  export RSYNC_PROXY="${http_proxy}"
fi

export NVM_DIR="${HOME}/.config/nvm"
# shellcheck disable=SC1091
[[ -s "${NVM_DIR}/nvm.sh" ]] && \. "${NVM_DIR}/nvm.sh"
