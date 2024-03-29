export QT_QPA_PLATFORMTHEME='qt5ct'
export TERMINAL='kitty'
export PAGER='bat'
export MANPAGER='sh -c "col --no-backspaces --spaces | bat --language="man" --plain"'
export MANROFFOPT='-c'
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export RIPGREP_CONFIG_PATH="${HOME}/.ripgreprc"
export TMPDIR='/tmp'
export LESS='--LONG-PROMPT --RAW-CONTROL-CHARS --ignore-case --window=-5 --quit-if-one-screen'
export PNPM_HOME="${XDG_DATA_HOME}/pnpm"
export NODE_REPL_HISTORY="${XDG_CACHE_HOME}/node_repl_history"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"
export PATH="${HOME}/bin:${XDG_DATA_HOME}/pnpm:/opt:${PATH}"
export JDK_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true'
export __GL_SYNC_TO_VBLANK=0
export __GL_GSYNC_ALLOWED=1
export __GL_SYNC_DISPLAY_DEVICE='DP-4'
export VDPAU_NVIDIA_SYNC_DISPLAY_DEVICE='DP-4'
export CLUTTER_DEFAULT_FPS=165
export FZF_CTRL_T_COMMAND='fd --hidden --type="file" --exclude=".{git,cache}"'
export FZF_ALT_C_COMMAND='fd --hidden --type="directory" --exclude=".{git,cache}"'
export FZF_CTRL_T_OPTS='--layout="default" --preview="bat --style=header-filename --color=always {}"'
export FZF_CTRL_R_OPTS='--preview="echo {}" --preview-window="down:3"'
export FZF_ALT_C_OPTS='--layout="default" --preview="lsd --tree {}"'
export FZF_DEFAULT_OPTS="\
--scroll-off=5 --preview-window='80%:wrap' --no-mouse --exit-0 --cycle \
--bind='ctrl-/:change-preview-window(down|),ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up' \
--color='bg+:#073642,spinner:#2aa198,hl:#268bd2' \
--color='fg:#839496,header:#268bd2,info:#b58900,pointer:#2aa198' \
--color='marker:#2aa198,fg+:#eee8d5,prompt:#b58900,hl+:#268bd2'"

if [[ -n "${DISPLAY}" ]]; then
  export EDITOR='nvim'
  export VISUAL='nvim'
  export SUDO_EDITOR='nvim'
  export SYSTEMD_EDITOR='nvim'
else
  export EDITOR='vi'
  export VISUAL='vi'
  export SUDO_EDITOR='vi'
  export SYSTEMD_EDITOR='vi'
fi
