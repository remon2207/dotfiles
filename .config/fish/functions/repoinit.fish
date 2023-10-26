function repoinit
  echo "# $(basename $(pwd))" > README.md
  git add .
  git commit -m 'Initial commit'
  git push -u origin main
end
