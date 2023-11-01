HISTFILE="${HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

# keybind
bindkey -e

for conf in "${HOME}/.config/zsh/conf.d/"*.zsh; do
  source "${conf}"
done
unset conf

eval "$(starship init zsh)"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/nvm/init-nvm.sh

# load fish
# if [[ $(ps --no-header -o comm) != 'fish' ]]; then
#   if type fish &> /dev/null; then
#     exec fish
#   fi
# fi
