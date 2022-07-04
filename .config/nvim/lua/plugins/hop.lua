require('hop').setup {
    vim.keymap.set('n', '<Leader><Leader>w', '<Cmd>HopWord<CR>', { noremap = true, silent = true }),
    vim.keymap.set('n', '<Leader><Leader>f', '<Cmd>HopChar2<CR>', { noremap = true, silent = true }),
    vim.keymap.set('n', '<Leader><Leader>h', '<Cmd>HopLineStart<CR>', { noremap = true, silent = true }),
    vim.keymap.set('n', '<Leader><Leader>p', '<Cmd>HopPattern<CR>', { noremap = true, silent = true })
}