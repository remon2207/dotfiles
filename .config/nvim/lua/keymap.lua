local keymap = vim.keymap

local opts = { noremap = true, silent = true }

keymap.set("n", "<Esc><Esc>", "<Cmd>set nohlsearch!<CR>", opts)

keymap.set('t', '<Esc>', '<C-|><C-n>', opts)
keymap.set('n', '<C-t>', '<Cmd>terminal<CR>', opts)

keymap.set('n', 'sp', '<Cmd>split<CR><C-w>w', opts)
keymap.set('n', 'vs', '<Cmd>vsplit<CR><C-w>w', opts)

keymap.set('n', 'tn', '<Cmd>tabnew<CR>', opts)
keymap.set('n', 'tl', '<Cmd>tabnext<CR>', opts)
keymap.set('n', 'th', '<Cmd>tabprevious<CR>', opts)

keymap.set('n', 'sh', '<C-w>h', opts)
keymap.set('n', 'sj', '<C-w>j', opts)
keymap.set('n', 'sk', '<C-w>k', opts)
keymap.set('n', 'sl', '<C-w>l', opts)

keymap.set('i', '<C-d>', '<Del>', opts)

keymap.set('n', 'fh', '<Cmd>bprev<CR>', opts)
keymap.set('n', 'fl', '<Cmd>bnext<CR>', opts)

keymap.set('n', 'x', '"_x', opts)
keymap.set('n', 'cit', '"_cit', opts)

keymap.set('n', '<ScrollWheelUp>', '<Nop>', opts)
keymap.set('n', '<ScrollWheelDown>', '<Nop>', opts)

keymap.set('n', '<C-z>', '<Nop>', opts)
keymap.set('n', 'm', '<Nop>', opts)
keymap.set('n', 'q', '<Nop>', opts)
