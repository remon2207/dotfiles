function repolybar
  set -l monitors dp dp2 dvi hdmi

  killall polybar &> /dev/null
  for monitor in $monitors
    polybar $monitor &> /dev/null &
    disown
  end
end
