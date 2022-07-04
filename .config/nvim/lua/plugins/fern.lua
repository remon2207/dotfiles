vim.keymap.set('n', '<C-n>', '<Cmd>Fern . -reveal=%<CR>', { noremap = true, silent = true })
vim.g['fern#renderer'] = 'nerdfont'
vim.g['fern#default_hidden'] = 1

vim.cmd[[
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
]]
