" nnoremap <C-n> :Fern . -reveal=% -drawer -toggle<CR>
" nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
nnoremap <C-n> :<C-u>Fern . -drawer -toggle -reveal=%<CR>
let g:fern#default_hidden = 1
let g:fern#renderer = 'nerdfont'
