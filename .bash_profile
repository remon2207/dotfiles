#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="${PATH}:${HOME}/go/bin"
export QT_QPA_PLATFORMTHEME="qt5ct"

if [[ -n ${DISPLAY} ]]; then
    if type nvim > /dev/null 2>&1; then
        export EDITOR="nvim"
        export VISUAL="nvim"
    fi
else
    if type vi > /dev/null 2>&1; then
        export EDITOR="vi"
        export VISUAL="vi"
    fi
fi

if type fzf > /dev/null 2>&1; then
    if type fd > /dev/null 2>&1; then
        export FZF_CTRL_T_COMMAND="fd --hidden -t f -E '.git' -E '.cache'"
        export FZF_ALT_C_COMMAND="fd --hidden -t d -E '.git' -E '.cache'"
        export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} \
        --height 40% --layout reverse --border --no-mouse \
        --color bg+:#073642,spinner:#2aa198,hl:#268bd2 \
        --color fg:#839496,header:#268bd2,info:#b58900,pointer:#2aa198 \
        --color marker:#2aa198,fg+:#eee8d5,prompt:#b58900,hl+:#268bd2"
    fi
fi

if type col > /dev/null 2>&1; type bat > /dev/null 2>&1; then
    export MANPAGER="sh -c 'col -bx | bat -l man -pn'"
fi

export BROWSER="firefox"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export GTK_IM_MODULE="fcitx5"
export QT_IM_MODULE="fcitx5"
export XMODIFIERS="@im=fcitx5"
export LIBVA_DRIVER_NAME="vdpau"
export VDPAU_DRIVER="nvidia"
