function changeterm
  # if not set -q $argv[1]
  #   echo 'error'
  #   return 1
  # end
  if not test $argv[1]
    # echo 'error'
    echo "\
changeterm --<現在のターミナル> --<変更先のターミナル>
"
    return 1
  end

  set -l dotfiles $HOME/ghq/github.com/remon2207/dotfiles
  set -l keybind $dotfiles/.config/i3/conf.d/appstart_keybind.conf
  set -l bghtop $dotfiles/.local/share/applications/bghtop.desktop

  set -l alacritty 'bindsym $mod+Return exec --no-startup-id alacritty'
  set -l alacritty_ranger 'bindsym $mod+e exec --no-startup-id alacritty -e ranger'

  set -l kitty 'bindsym $mod+Return exec --no-startup-id kitty'
  set -l kitty_ranger 'bindsym $mod+e exec --no-startup-id kitty -1 ranger'

  set -l wezterm 'bindsym $mod+Return exec --no-startup-id wezterm'
  set -l wezterm_ranger 'bindsym $mod+e exec --no-startup-id wezterm -e ranger'

  if test $argv[1] = '--alacritty'; and test $argv[2] = '--kitty'
    sd '^alacritty' '# alacritty' $dotfiles/.xinitrc
    sd '^# kitty' 'kitty' $dotfiles/.xinitrc

    sd -s "$alacritty" "# $alacritty" $keybind
    sd -s "$alacritty_ranger" "# $alacritty_ranger" $keybind
    sd -s "# $kitty" "$kitty" $keybind
    sd -s "# $kitty_ranger" "$kitty_ranger" $keybind

    sd 'Exec=alacritty' '# Exec=alacritty' $bghtop
    sd '# Exec=kitty' 'Exec=kitty' $bghtop
  else if test $argv[1] = '--alacritty'; and test $argv[2] = '--wezterm'
    sd '^alacritty' '# alacritty' $dotfiles/.xinitrc
    sd '^# wezterm' 'wezterm' $dotfiles/.xinitrc

    sd -s "$alacritty" "# $alacritty" $keybind
    sd -s "$alacritty_ranger" "# $alacritty_ranger" $keybind
    sd -s "# $wezterm" "$wezterm" $keybind
    sd -s "# $wezterm_ranger" "$wezterm_ranger" $keybind

    sd 'Exec=alacritty' '# Exec=alacritty' $bghtop
    sd '# Exec=wezterm' 'Exec=wezterm' $bghtop
  else if test $argv[1] = '--kitty'; and test $argv[2] = '--alacritty'
    sd '^kitty' '# kitty' $dotfiles/.xinitrc
    sd '^# alacritty' 'alacritty' $dotfiles/.xinitrc

    sd -s "$kitty" "# $kitty" $keybind
    sd -s "$kitty_ranger" "# $kitty_ranger" $keybind
    sd -s "# $alacritty" "$alacritty" $keybind
    sd -s "# $alacritty_ranger" "$alacritty_ranger" $keybind

    sd 'Exec=kitty' '# Exec=kitty' $bghtop
    sd '# Exec=alacritty' 'Exec=alacritty' $bghtop
  else if test $argv[1] = '--kitty'; and test $argv[2] = '--wezterm'
    sd '^kitty' '# kitty' $dotfiles/.xinitrc
    sd '^# wezterm' 'wezterm' $dotfiles/.xinitrc

    sd -s "$kitty" "# $kitty" $keybind
    sd -s "$kitty_ranger" "# $kitty_ranger" $keybind
    sd -s "# $wezterm" "$wezterm" $keybind
    sd -s "# $wezterm_ranger" "$wezterm_ranger" $keybind

    sd 'Exec=kitty' '# Exec=kitty' $bghtop
    sd '# Exec=wezterm' 'Exec=wezterm' $bghtop
  else if test $argv[1] = '--wezterm'; and test $argv[2] = '--alacritty'
    sd '^wezterm' '# wezterm' $dotfiles/.xinitrc
    sd '^# alacritty' 'alacritty' $dotfiles/.xinitrc

    sd -s "$wezterm" "# $wezterm" $keybind
    sd -s "$wezterm_ranger" "# $wezterm_ranger" $keybind
    sd -s "# $alacritty" "$alacritty" $keybind
    sd -s "# $alacritty_ranger" "$alacritty_ranger" $keybind

    sd 'Exec=wezterm' '# Exec=wezterm' $bghtop
    sd '# Exec=alacritty' 'Exec=alacritty' $bghtop
  else if test $argv[1] = '--wezterm'; and test $argv[2] = '--kitty'
    sd '^wezterm' '# wezterm' $dotfiles/.xinitrc
    sd '^# kitty' 'kitty' $dotfiles/.xinitrc

    sd -s "$wezterm" "# $wezterm" $keybind
    sd -s "$wezterm_ranger" "# $wezterm_ranger" $keybind
    sd -s "# $kitty" "$kitty" $keybind
    sd -s "# $kitty_ranger" "$kitty_ranger" $keybind

    sd 'Exec=wezterm' '# Exec=wezterm' $bghtop
    sd '# Exec=kitty' 'Exec=kitty' $bghtop
  end
end
