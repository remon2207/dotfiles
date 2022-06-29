let g:ale_linters_explicit = 1

let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'javascriptreact': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'typescriptreact': ['prettier'],
      \ }

let g:ale_fix_on_save = 1

" let g:ale_linters = {
"       \ 'javascript': ['eslint'],
"       \ 'javascriptreact': ['eslint'],
"       \ 'typescript': ['tsserver','eslint'],
"       \ 'typescriptreact': ['tsserver','eslint'],
"       \ 'dockerfile': ['hadolint'],
"       \ }

let g:ale_linters = {
      \ 'javascript': ['cspell'],
      \ 'typescript': ['cspell'],
      \ 'javascriptreact': ['cspell'],
      \ 'typescriptreact': ['cspell']
      \ }

let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] (%code%): %s [%severity%]'

nmap <silent> <C-w>j <Plug>(ale_next_wrap)
nmap <silent> <C-w>k <Plug>(ale_previous_wrap)
