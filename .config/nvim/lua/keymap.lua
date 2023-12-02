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
keymap.set('n', '<S-h>', '<Cmd>bprev<CR>', opts)
keymap.set('n', '<S-l>', '<Cmd>bnext<CR>', opts)

keymap.set('n', 'x', '"_x', opts)

-- keymap.set('n', '<C-z>', '<Nop>', opts)
keymap.set('n', 'm', '<Nop>', opts)
keymap.set({ 'n', 'v' }, 'q', '<Nop>', opts)
-- Lazy.nvim
keymap.set('n', '<Leader>L', '<Cmd>Lazy<CR>', opts)
