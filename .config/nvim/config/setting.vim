" 改行時の自動コメントアウトを無効化
autocmd FileType * set formatoptions-=r
autocmd FileType * set formatoptions-=o

if executable('fcitx5')
  autocmd InsertLeave * :call system('fcitx5-remote -c')
endif

" プロバイダを無効化
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

" for Python
let g:python3_host_prog = '/usr/bin/python3'

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
