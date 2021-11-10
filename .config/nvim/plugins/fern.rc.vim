" nnoremap <C-n> :Fern . -reveal=% -drawer -toggle<CR>
" nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
nnoremap <silent> <C-n> :<C-u>Fern . -drawer -reveal=% -width=40<CR>
let g:fern#default_hidden = 1
let g:fern#renderer = 'nerdfont'
