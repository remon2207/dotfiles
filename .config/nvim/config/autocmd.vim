if executable('fcitx5')
  autocmd InsertLeave * :call system('fcitx5-remote -c')
  autocmd CmdlineLeave * :call system('fcitx5-remote -c')
endif


augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx,*.json,*.yml,*.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup file
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx EslintFixAll
augroup END

augroup file
  autocmd!
  autocmd BufNewFile,BufRead tsconfig.json,jsconfig.json setlocal ft=jsonc
augroup END
