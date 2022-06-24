let g:ale_linters_explicit = 1

" let g:ale_fixers = {
"       \ 'javascript': ['eslint'],
"       \ 'javascriptreact': ['eslint'],
"       \ 'typescript': ['eslint'],
"       \ 'typescriptreact': ['eslint'],
"       \ }

" let g:ale_fix_on_save = 1

let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'javascriptreact': ['eslint'],
      \ 'typescript': ['tsserver','eslint'],
      \ 'typescriptreact': ['tsserver','eslint'],
      \ }

let g:ale_open_list = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] (%code%): %s [%severity%]'

nmap <silent> <C-w>j <Plug>(ale_next_wrap)
nmap <silent> <C-w>k <Plug>(ale_previous_wrap)
