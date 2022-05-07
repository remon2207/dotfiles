# zsh-syntax-highlighting
#   https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
typeset -A ZSH_HIGHLIGHT_STYLES

# keywords such as `if`, `while`, etc...
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow,bold'

# command (has executable file)
ZSH_HIGHLIGHT_STYLES[command]='fg=white,bold'
# builtin commands, aliases, functions, etc...
ZSH_HIGHLIGHT_STYLES[arg0]='fg=white,bold,underline'
ZSH_HIGHLIGHT_STYLES[alias]='fg=white,bold,underline'

# file path
ZSH_HIGHLIGHT_STYLES[path]='fg=white,underline'

# '...'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=cyan,underline'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=cyan,underline'
# "..."
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=blue,underline'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=blue,underline'

# $(...)
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=white,bold'
# <(...)
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=white,bold'
# `...`
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=white,bold'

# options
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=green,underline'

# unknown
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
