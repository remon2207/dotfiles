vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')

vim.keymap.set('i', '<Up>', '<Nop>')
vim.keymap.set('i', '<Down>', '<Nop>')
vim.keymap.set('i', '<Left>', '<Nop>')
vim.keymap.set('i', '<Right>', '<Nop>')

-- ESCキー2度押しでハイライトの有無の切り替え
vim.keymap.set('n', '<Esc><Esc>', '<Cmd>set nohlsearch!<CR>')

-- ctrl + sで保存
vim.keymap.set('i', '<C-s>', '<ESC><Cmd>update<CR>')

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.keymap.set('t', '<Esc>', '<C-|><C-n>')
vim.keymap.set('n', '<C-t>', '<Cmd>terminal<CR>')

vim.keymap.set('n', 'ss', '<Cmd>split<CR><C-w>w')
vim.keymap.set('n', 'sv', '<Cmd>vsplit<CR><C-w>w')

vim.keymap.set('n', 'tn', '<Cmd>tabnew<CR>')
vim.keymap.set('n', 'tl', 'gt')
vim.keymap.set('n', 'th', 'gT')

vim.keymap.set('i', '<C-d>', '<Del>')

vim.keymap.set('n', 'fh', '<Cmd>bprev<CR>')
vim.keymap.set('n', 'fl', '<Cmd>bnext<CR>')

vim.keymap.set('n', '<C-z>', '<Nop>')