-- ESCキー2度押しでハイライトの有無の切り替え
vim.keymap.set('n', '<Esc><Esc>', '<Cmd>set nohlsearch!<CR>', { noremap = true, silent = true })

-- ctrl + sで保存
vim.keymap.set('i', '<C-s>', '<ESC><Cmd>write<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'j', 'gjzz', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gkzz', { noremap = true, silent = true })
vim.keymap.set('n', 'e', 'ezz', { noremap = true, silent = true })
vim.keymap.set('n', '+', '+zz', { noremap = true, silent = true })
vim.keymap.set('n', '-', '-zz', { noremap = true, silent = true })
vim.keymap.set('n', 'b', 'bzz', { noremap = true, silent = true })
vim.keymap.set('n', 'w', 'wzz', { noremap = true, silent = true })
vim.keymap.set('n', 'ge', 'gezz', { noremap = true, silent = true })
vim.keymap.set('n', 'E', 'Ezz', { noremap = true, silent = true })
vim.keymap.set('n', 'B', 'Bzz', { noremap = true, silent = true })
vim.keymap.set('n', 'W', 'Wzz', { noremap = true, silent = true })
vim.keymap.set('n', 'gE', 'gEzz', { noremap = true, silent = true })
vim.keymap.set('n', 'n', 'nzz', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzz', { noremap = true, silent = true })
vim.keymap.set('n', 'G', 'Gzz', { noremap = true, silent = true })
vim.keymap.set('n', 'g;', 'g;zz', { noremap = true, silent = true })
vim.keymap.set('n', 'g,', 'g,zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-r>', '<C-r>zz', { noremap = true, silent = true })
vim.keymap.set('n', '%', '%zz', { noremap = true, silent = true })
vim.keymap.set('n', '<S-h>', '<S-h>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<S-m>', '<S-m>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<S-l>', '<S-l>zz', { noremap = true, silent = true })
vim.keymap.set('i', '<Esc>', '<Esc>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-f>', '<C-f>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-b>', '<C-b>zz', { noremap = true, silent = true })
vim.keymap.set('v', 'j', 'jzz', { noremap = true, silent = true })
vim.keymap.set('v', 'k', 'kzz', { noremap = true, silent = true })
vim.keymap.set('v', 'd', 'dzz', { noremap = true, silent = true })

vim.keymap.set('t', '<Esc>', '<C-|><C-n>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-t>', '<Cmd>terminal<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'ss', '<Cmd>split<CR><C-w>w', { noremap = true, silent = true })
vim.keymap.set('n', 'sv', '<Cmd>vsplit<CR><C-w>w', { noremap = true, silent = true })

vim.keymap.set('n', 'tn', '<Cmd>tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'tl', '<Cmd>tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'th', '<Cmd>tabprevious<CR>', { noremap = true, silent = true })

vim.keymap.set('i', '<C-d>', '<Del>', { noremap = true, silent = true })

vim.keymap.set('n', 'fh', '<Cmd>bprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'fl', '<Cmd>bnext<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-z>', '<Nop>', { noremap = true, silent = true })
