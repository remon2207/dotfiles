augroup fileRead
  autocmd!
  autocmd BufEnter *.css,*.scss,*.js,*.jsx,*.ts,*.tsx execute 'ColorHighlight'
  " autocmd BufNewFile,BufRead, *.ts setfiletype typescript
  autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
  autocmd BufNewFile,BufRead Dockerfile set ft=dockerfile
  " autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
augroup END

augroup color-highlight
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx,*.json,*.yml,*.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
  " autocmd VimEnter *.js,*.jsx,*.ts,*.tsx,*.json,*.yml,*.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

