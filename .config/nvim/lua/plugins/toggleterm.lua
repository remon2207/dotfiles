require('toggleterm').setup {
    direction = 'float'
}

vim.keymap.set('n', '<Leader>ft', '<Cmd>ToggleTerm<CR>', { noremap = true, silent = true })
