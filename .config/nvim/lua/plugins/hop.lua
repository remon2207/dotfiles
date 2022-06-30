require('hop').setup {
    vim.keymap.set('n', '<Leader><Leader>w', '<Cmd>HopWord<CR>'),
    vim.keymap.set('n', '<Leader><Leader>f', '<Cmd>HopChar2<CR>'),
    vim.keymap.set('n', '<Leader><Leader>h', '<Cmd>HopLineStart<CR>'),
    vim.keymap.set('n', '<Leader><Leader>p', '<Cmd>HopPattern<CR>')
}
