function cup
  checkupdates

  if test $status -eq 0
    echo
    read -l -P 'Do you want to update?(y/n): ' yn

    switch $yn
      case Y y
        paru -Syu
      case N n
        return 0
    end
  else
    return 1
  end
end
