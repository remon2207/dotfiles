" キーマップ
nnoremap <s-n> :Fern . -reveal=% -opener=split<CR>
" nnoremap <c-n> :<C-u>Fern . -reveal=% -drawer<CR>
" nnoremap <c-n> :<c-u>Fern . -reveal=% -drawer -toggle<cr>
nnoremap <c-n> <c-w>w:<c-u>Fern . -reveal=%<CR>

let g:fern#disable_default_mappings = 1
function! FernInit() abort
  nmap <buffer> M <Plug>(fern-action-new-dir)
  nmap <buffer> N <Plug>(fern-action-new-file)
  nmap <buffer> <CR> <Plug>(fern-action-open-or-enter)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> h <Plug>(fern-action-collapse)
  nmap <buffer> l <Plug>(fern-action-open-or-expand)
  nmap <buffer> <F5> <Plug>(fern-action-reload)
  nmap <buffer> r <Plug>(fern-action-rename)
endfunction
augroup FernEvents
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

" let
let g:fern#default_hidden=1
