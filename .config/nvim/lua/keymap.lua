local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<Esc><Esc>', '<Cmd>set nohlsearch!<CR>', opts)

keymap('n', 'ss', '<Cmd>split<CR><C-w>w', opts)
keymap('n', 'sv', '<Cmd>vsplit<CR><C-w>w', opts)

keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('i', '<C-d>', '<Del>', opts)

keymap('n', '<S-h>', '<Cmd>bprev<CR>', opts)
keymap('n', '<S-l>', '<Cmd>bnext<CR>', opts)

keymap('n', 'x', '"_x', opts)

keymap('n', 'm', '<Nop>', opts)
keymap({ 'n', 'v' }, 'q', '<Nop>', opts)
-- Lazy.nvim
keymap('n', '<Leader>L', '<Cmd>Lazy<CR>', opts)

-- パスのチルダを${HOME}へ変更
keymap('n', '<Leader>d~', '<Cmd>s/\\~/${HOME}/<CR>', opts)
