-- ESCキー2度押しでハイライトの有無の切り替え
vim.keymap.set('n', '<Esc><Esc>', '<Cmd>set nohlsearch!<CR>', { noremap = true, silent = true })

-- ctrl + sで保存
vim.keymap.set('i', '<C-s>', '<ESC><Cmd>update<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })

vim.keymap.set('t', '<Esc>', '<C-|><C-n>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-t>', '<Cmd>terminal<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'ss', '<Cmd>split<CR><C-w>w', { noremap = true, silent = true })
vim.keymap.set('n', 'sv', '<Cmd>vsplit<CR><C-w>w', { noremap = true, silent = true })

vim.keymap.set('n', 'tn', '<Cmd>tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'tl', 'gt', { noremap = true, silent = true })
vim.keymap.set('n', 'th', 'gT', { noremap = true, silent = true })

vim.keymap.set('i', '<C-d>', '<Del>', { noremap = true, silent = true })

vim.keymap.set('n', 'fh', '<Cmd>bprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'fl', '<Cmd>bnext<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-z>', '<Nop>', { noremap = true, silent = true })