alias dc "cd"
alias e "exit"
alias :q "exit"
alias c "clear"
alias sudo "sudo "
alias rm "rm -rf"
alias ls "ls --color=auto"
alias ll "ls -alF"
alias la "ls -A"
alias sl "ls"
alias mkdir "mkdir -p"
alias cfont "cd $HOME/.config/fontconfig"
alias cvim "cd $HOME/.config/nvim/lua"
alias cpolybar "cd $HOME/.config/polybar"
alias cpicom "cd $HOME/.config/picom"
alias grep "grep --color=auto"
alias dexec "docker compose exec"
alias drun "docker compose run --rm"
alias ddown "docker compose down"
alias dup "docker compose up -d"
alias dlogs "docker compose logs -f"
alias dps "docker compose ps -a"
alias dbuild "docker compose build"
alias g "git"
alias glog "git log --oneline --graph"
alias repoinit 'echo "# $(basename $(pwd))" > README.md && git add . && git commit -m "Initial commit" && git push -u origin main'

function mkcd
    mkdir -p $1 && cd $1
end

if test -n $DISPLAY
    # aliases

    if type lsd &> /dev/null
        alias ls "lsd --color=auto"
        alias ll "lsd -alF --color=auto"
        alias la "lsd -A --color=auto"
    else
        alias ls "ls --color=auto"
        alias ll "ls -alF --color=auto"
        alias la "ls -A --color=auto"
    end

    if type nvim &> /dev/null
        alias vim "nvim"
    end

    alias killstartup "killall Discord slack"
    alias b "bluetoothctl"
end

# common aliases
if type fd &> /dev/null
    alias find "fd"
end

if type lazydocker &> /dev/null
    alias lzd "lazydocker"
end

if type fzf &> /dev/null
    alias repos "ghq list -p | fzf"
    alias repo 'cd $(repos)'
    alias fontlist "fc-list | fzf"
end

if type tmux &> /dev/null
    alias t "tmux"
end

if type rg &> /dev/null
    alias grep "rg --color=auto"
else
    alias grep "grep --color=auto"
end

if type bat &> /dev/null
    alias cat "bat"
end

if type fd &> /dev/null
    alias find "fd"
end

if type ranger &> /dev/null
    alias r "ranger"
end

if type lazydocker &> /dev/null
    alias lzd "lazydocker"
end

if type fzf &> /dev/null
    alias repos "ghq list -p | fzf"
    alias repo 'cd $(repos)'
end

if type tldr &> /dev/null
    alias rman "tldr"
end

if type tmux &> /dev/null
    alias t "tmux"
end

# if type sd &> /dev/null
#     alias sed "sd"
# end

if type delta &> /dev/null
    alias diff "delta -n"
end
