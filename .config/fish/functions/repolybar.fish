function repolybar
  killall polybar &> /dev/null
  bash -c 'nohup polybar dp &> /dev/null &'
  bash -c 'nohup polybar dp2 &> /dev/null &'
  bash -c 'nohup polybar dvi &> /dev/null &'
  bash -c 'nohup polybar hdmi &> /dev/null &'
end
