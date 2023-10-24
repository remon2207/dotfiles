function psag
  ps -auxf | rg --color auto -in $argv
end
