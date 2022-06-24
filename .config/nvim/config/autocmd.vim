augroup fileRead
  autocmd!
  autocmd BufEnter *.css,*.scss,*.js,*.jsx,*.ts,*.tsx execute 'ColorHighlight'
  autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
augroup END

augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx,*.json,*.yml,*.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
