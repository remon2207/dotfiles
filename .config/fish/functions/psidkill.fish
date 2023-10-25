function psidkill
  set -l psid (ps -aux | rg -i $argv[1] | awk '{print $2}' | head -n 1)

  kill $psid
end
