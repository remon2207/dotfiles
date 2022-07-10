" IMEの自動無効化
autocmd InsertLeave * call system('fcitx5-remote -c')

augroup file
  autocmd!
  autocmd BufWritePre *.ts,*.jsx,*.ts,*.tsx EslintFixAll
  autocmd BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx,*.json,*.jsonc,*.yaml,*.yml,*.vim setlocal expandtab tabstop=2 autoindent smartindent shiftwidth=2 softtabstop=2 smarttab
  autocmd BufNewFile,BufRead tsconfig.json,jsconfig.json setlocal ft=jsonc
augroup END
