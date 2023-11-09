zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:default' menu yes select search

zstyle ':completion::complete:*' use-cache 1

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

zstyle ':fzf-tab:complete:*' fzf-pad 10

zstyle ':autocomplete:*' insert-unambiguous yes

# Autocompletion
zstyle -e ':autocomplete:list-choices:*' list-lines 'reply=( $(( LINES / 3 )) )'

# Override history search.
zstyle ':autocomplete:history-incremental-search-backward:*' list-lines 8

# History menu.
zstyle ':autocomplete:history-search-backward:*' list-lines 256

zstyle ':autocomplete:*' ignored-input '..##'
