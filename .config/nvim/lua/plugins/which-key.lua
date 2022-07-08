require('which-key').setup {}

vim.keymap.set('n', '<Leader>wk', '<Cmd>WhichKey<CR>', { noremap = true, silent = true })
