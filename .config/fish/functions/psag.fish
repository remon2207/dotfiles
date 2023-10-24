function psag
  ps auxf | rg -i $argv
end
