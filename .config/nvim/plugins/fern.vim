" nnoremap <silent> <C-n> :<C-u>Fern . -reveal=% -drawer<CR>
nnoremap <silent> <C-n> :<C-u>Fern . -reveal=%<CR>

let g:fern#default_hidden = 1
function! FernInit() abort
  nmap <buffer> d <Plug>(fern-action-remove)
endfunction
augroup FernEvents
  autocmd!
  autocmd FileType fern call FernInit()
augroup END


" fern-renderer-nerdfont
let g:fern#renderer = 'nerdfont'


" fern-preview
function! s:fern_settings() abort
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END

" fern-renderer-devicons
let g:fern#renderer = "devicons"
let g:fern_renderer_devicons_disable_warning = 1

" let g:fern#default_exclude = '^\(node_modules\|\package-lock.json\)'
