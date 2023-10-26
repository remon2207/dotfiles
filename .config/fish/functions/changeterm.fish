function changeterm
  if not test $argv[1]
    echo 'changeterm --<現在のターミナル> --<変更先のターミナル>'
    return 1
  end

  set -g dotfiles $HOME/ghq/github.com/remon2207/dotfiles
  set -g keybind $dotfiles/.config/i3/conf.d/appstart_keybind.conf
  set -g bghtop $dotfiles/.local/share/applications/bghtop.desktop
  
  set -g alacritty 'bindsym $mod+Return exec --no-startup-id alacritty'
  set -g alacritty_ranger 'bindsym $mod+e exec --no-startup-id alacritty -e ranger'
  
  set -g kitty 'bindsym $mod+Return exec --no-startup-id kitty'
  set -g kitty_ranger 'bindsym $mod+e exec --no-startup-id kitty -1 ranger'
  
  set -g wezterm 'bindsym $mod+Return exec --no-startup-id wezterm'
  set -g wezterm_ranger 'bindsym $mod+e exec --no-startup-id wezterm -e ranger'

  function sdlist
    sd "^$argv[1]" "# $argv[1]" $dotfiles/.xinitrc
    sd "^# $argv[2]" "$argv[2]" $dotfiles/.xinitrc

    sd -s "$argv[3]" "# $argv[3]" $keybind
    sd -s "$argv[4]" "# $argv[4]" $keybind
    sd -s "# $argv[5]" "$argv[5]" $keybind
    sd -s "# $argv[6]" "$argv[6]" $keybind

    sd "Exec=$argv[1]" "# Exec=$argv[1]" $bghtop
    sd "# Exec=$argv[2]" "Exec=$argv[2]" $bghtop
  end

  if test $argv[1] = '--alacritty' && test $argv[2] = '--kitty'
    sdlist alacritty kitty $alacritty $alacritty_ranger $kitty $kitty_ranger
  else if test $argv[1] = '--alacritty' && test $argv[2] = '--wezterm'
    sdlist alacritty wezterm $alacritty $alacritty_ranger $wezterm $wezterm_ranger
  else if test $argv[1] = '--kitty' && test $argv[2] = '--alacritty'
    sdlist kitty alacritty $kitty $kitty_ranger $alacritty $alacritty_ranger
  else if test $argv[1] = '--kitty' && test $argv[2] = '--wezterm'
    sdlist kitty wezterm $kitty $kitty_ranger $wezterm $wezterm_ranger
  else if test $argv[1] = '--wezterm' && test $argv[2] = '--alacritty'
    sdlist wezterm alacritty $wezterm $wezterm_ranger $alacritty $alacritty_ranger
  else if test $argv[1] = '--wezterm' && test $argv[2] = '--kitty'
    sdlist wezterm kitty $wezterm $wezterm_ranger $kitty $kitty_ranger
  end

  set -e dotfiles keybind bghtop alacritty alacritty_ranger kitty kitty_ranger wezterm wezterm_ranger
end
