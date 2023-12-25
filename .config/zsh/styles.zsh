zstyle ':compinstall' filename "${HOME}/.zshrc"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' rehash 1
zstyle ':completion:*' use-cache true
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:default' menu yes select search

zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' fzf-flags '--layout="default"'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd --oneline --color="always" "${realpath}"'
