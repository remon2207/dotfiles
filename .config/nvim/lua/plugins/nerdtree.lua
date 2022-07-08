vim.keymap.set('n', '<C-n>', '<Cmd>NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.cmd[[
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]]

vim.g.NERDTreeShowHidden = true
vim.g.NERDTreeMinimalUI = true
vim.g.NERDTreeMinimalMenu = true
vim.g.NERDTreeQuitOnOpen = 3
