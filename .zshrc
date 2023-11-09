HISTFILE="${HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
isArch=$(grep '^NAME' /etc/os-release | awk -F '"' '{print $2}')

# keybind
bindkey -e

for conf in "${HOME}/.config/zsh/conf.d/"*.zsh; do
  source "${conf}"
done
unset conf

eval "$(starship init zsh)"

source /usr/share/fzf/key-bindings.zsh

if [[ "${isArch}" == 'Arch Linux' ]]; then
  source /usr/share/fzf/completion.zsh
  source /usr/share/nvm/init-nvm.sh
fi
unset isArch

if [ -f "${HOME}/.profile" ]; then
  source "${HOME}/.profile"
fi

# load fish
# if [[ $(ps --no-header -o comm) != 'fish' ]]; then
#   if type fish &> /dev/null; then
#     exec fish
#   fi
# fi
