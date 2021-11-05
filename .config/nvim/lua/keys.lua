local map = vim.api.nvim_set_keymap

-- neovim終了
-- map('t', '<c-q>', '<c-\\><c-n>:q<cr>', { noremap = true })
map('t', '<c-q>', '<c-\\><c-n>:q<cr>', { noremap = true })
map('n', '<c-q>', '<c-\\><c-n>:q<cr>', { noremap = true })
-- ハイライトの切り替え
map('n', '<esc><esc>', ':<c-u>set nohlsearch!<cr>', { noremap = true })
-- 行頭に移動
map('c', '<c-a>', '<home>', { noremap = true })
map('i', '<c-a>', '<home>', { noremap = true })
-- 行末に移動
map('i', '<c-e>', '<end>', { noremap = true })
map('i', '<c-e>', '<end>', { noremap = true })
-- ファイル更新
map('i', '<c-l>', '<esc>:update<cr>', { noremap = true, silent = true })
-- インサートモードへ
map('i', 'jj', '<esc>', { noremap = true })
-- 行が折り返しされていたら表示業単位で移動
map('n', 'j', 'gj', { noremap = true })
map('n', 'k', 'gk', { noremap = true })
map('n', '<down>', 'gj', { noremap = true })
map('n', '<up', 'gk', { noremap = true })


if vim.cmd("echo has('nvim')") then
  map('t', '<esc>', '<c-\\><c-n>', { noremap = true })
  -- ターミナル
  map('n', '<c-t>', ':<c-u>terminal<cr>', { noremap = true })
  -- ウインドウ分割
  map('n', 'ss', ':<c-u>sp<cr><c-w>w', { noremap = true })
  map('n', 'sv', ':<c-u>vs<cr><c-w>w', { noremap = true })
end
