local keymap = vim.keymap

local opts = { noremap = true, silent = true }

keymap.set('n', '<Esc><Esc>', '<Cmd>set nohlsearch!<CR>', opts)

keymap.set('n', 'ss', '<Cmd>split<CR><C-w>w', opts)
keymap.set('n', 'sv', '<Cmd>vsplit<CR><C-w>w', opts)

keymap.set('n', '<C-h>', '<C-w>h', opts)
keymap.set('n', '<C-j>', '<C-w>j', opts)
keymap.set('n', '<C-k>', '<C-w>k', opts)
keymap.set('n', '<C-l>', '<C-w>l', opts)

keymap.set('i', '<C-d>', '<Del>', opts)

-- keymap.set('n', 'fh', '<Cmd>bprev<CR>', opts)
-- keymap.set('n', 'fl', '<Cmd>bnext<CR>', opts)
keymap.set('n', 'H', '<Cmd>bprev<CR>', opts)
keymap.set('n', 'L', '<Cmd>bnext<CR>', opts)

keymap.set('n', 'x', '"_x', opts)
keymap.set('n', 'cit', '"_cit', opts)
keymap.set('n', 'cw', '"_cw', opts)
keymap.set('n', "ci'", '"_ci\'', opts)
keymap.set('n', 'ci"', '"_ci"', opts)
keymap.set('n', 'ci{', '"_ci{', opts)
keymap.set('n', 'ci}', '"_ci}', opts)

keymap.set('v', 'c', '"_c', opts)

-- keymap.set('n', '<ScrollWheelUp>', '<Nop>', opts)
-- keymap.set('n', '<ScrollWheelDown>', '<Nop>', opts)

keymap.set('n', '<C-z>', '<Nop>', opts)
keymap.set('n', 'm', '<Nop>', opts)
keymap.set({ 'n', 'v' }, 'q', '<Nop>', opts)

-- インクリメント解除
-- keymap.set('n', '<C-a>', '<Nop>', opts)
-- keymap.set('n', '<C-x>', '<Nop>', opts)
-- インクリメント
-- keymap.set('n', '+', '<C-a>', opts)
-- keymap.set('n', '-', '<C-x>', opts)

-- Lazy.nvim
keymap.set('n', '<Leader>L', '<Cmd>Lazy<CR>', opts)
