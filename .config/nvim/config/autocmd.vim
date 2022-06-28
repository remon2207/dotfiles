" 改行時の自動コメントアウトを無効化
autocmd FileType * set formatoptions-=ro

augroup fileRead
  autocmd!
  autocmd BufEnter *.css,*.scss,*.js,*.jsx,*.ts,*.tsx execute 'ColorHighlight'
  autocmd VimEnter tsconfig.json,jsconfig.json setlocal ft=jsonc commentstring=//\ %s
augroup END

augroup fileWrite
  autocmd!
  autocmd BufWrite *.sql CocCommand sql.Format
augroup END

augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx,*.json,*.yml,*.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

if executable('fcitx5')
  autocmd InsertLeave * :call system('fcitx5-remote -c')
endif