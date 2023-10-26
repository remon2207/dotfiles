function changebrowser
  if not test $argv[1]
    echo 'changeterm --<現在のブラウザ> --<変更先のブラウザ>'
    return 1
  end

  function sdlist
    set -l dotfiles $HOME/ghq/github.com/remon2207/dotfiles
    set -l mimeapps $dotfiles/.config/mimeapps.list
    set -l advanced $dotfiles/.config/kitty/conf.d/advanced.conf
    set -l env $dotfiles/.config/alacritty/conf.d/env.yml

    sd "$argv[1]" "$argv[3]" $mimeapps
    sd "$argv[2]" "$argv[4]" $advanced
    sd "$argv[2]" "$argv[4]" $env
  end

  if test $argv[1] = '--vivaldi' && test $argv[2] = '--chrome'
    sdlist vivaldi-stable vivaldi-stable google-chrome google-chrome-stable
  else if test $argv[1] = '--vivaldi' && test $argv[2] = '--firefox'
    sdlist vivaldi-stable vivaldi-stable firefox firefox
  else if test $argv[1] = '--chrome' && test $argv[2] = '--vivaldi'
    sdlist google-chrome google-chrome-stable vivaldi-stable vivaldi-stable
  else if test $argv[1] = '--chrome' && test $argv[2] = '--firefox'
    sdlist google-chrome google-chrome-stable firefox
  else if test $argv[1] = '--firefox' && test $argv[2] = '--vivaldi'
    sdlist firefox firefox vivaldi-stable vivaldi-stable
  else if test $argv[1] = '--firefox' && test $argv[2] = '--chrome'
    sdlist firefox firefox google-chrome google-chrome-stable
  end

end
