local map = vim.api.nvim_set_keymap

-- neovim終了
-- map('t', '<c-q>', '<c-\\><c-n>:q<cr>', { noremap = true })
map('t', '<C-q>', '<C-\\><C-n>:q<CR>', { noremap = true })
map('n', '<C-q>', '<C-\\><C-n>:q<CR>', { noremap = true })
-- ハイライトの切り替え
map('n', '<ESC><ESC>', ':<C-U>set nohlsearch!<cr>', { noremap = true })
-- 行頭に移動
map('c', '<C-a>', '<Home>', { noremap = true })
map('i', '<C-a>', '<Home>', { noremap = true })
-- 行末に移動
map('i', '<C-e>', '<End>', { noremap = true })
map('i', '<C-e>', '<End>', { noremap = true })
-- ファイル更新
map('i', '<C-s>', '<ESC>:update<CR>', { noremap = true, silent = true })
-- インサートモードへ
map('i', 'jj', '<Esc>', { noremap = true })
-- 行が折り返しされていたら表示業単位で移動
map('n', 'j', 'gj', { noremap = true })
map('n', 'k', 'gk', { noremap = true })
map('n', '<down>', 'gj', { noremap = true })
map('n', '<up>', 'gk', { noremap = true })
if vim.cmd("echo has('nvim')") then
  map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
  -- ターミナル
  map('n', '<C-t>', ':<C-U>terminal<CR>', { noremap = true })
  -- ウインドウ分割
  map('n', 'ss', ':<C-u>sp<CR><C-w>w', { noremap = true })
  map('n', 'sv', ':<C-u>vs<CR><C-w>w', { noremap = true })
end
-- ts
vim.cmd('autocmd FileType typescript inoremap <C-s><C-f> <Esc>:Format<CR>i')
-- tsx
vim.cmd('autocmd FileType typescriptreact inoremap <C-s><C-f> <Esc>:Format<CR>i')
-- js
vim.cmd('autocmd FileType javascript inoremap <C-s><C-f> <Esc>:Format<CR>i')
-- jsx
vim.cmd('autocmd FileType javascriptreact inoremap <C-s><C-f> <Esc>:Format<CR>i')
