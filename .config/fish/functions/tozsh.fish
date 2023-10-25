function tozsh
  set -l dotfiles $HOME/ghq/github.com/remon2207/dotfiles
  set -l startline (math (cat $HOME/.zshrc | rg -n 'load fish' | cut -d ':' -f 1) + 1)
  set -l endline (cat $HOME/.zshrc | wc -l)

  sed -i "$startline,"$endline"s/^/# /" $dotfiles/.zshrc
  sed -i '3s/^/# /' $dotfiles/.tmux.conf
  sed -i '2s/^# //' $dotfiles/.tmux.conf

  if test $status -eq 0
    exit
  end
end
