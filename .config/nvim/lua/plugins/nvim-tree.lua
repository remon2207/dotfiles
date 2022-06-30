require('nvim-tree').setup {
    sort_by = 'case_sensitive',
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                {
                    key = 'u',
                    action = 'dir_up'
                },
                {
                    key = "f",
                    action = ''
                },
                {
                    key = "<C-_>",
                    action = 'live_filter'
                },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
}

-- vim.keymap.set('n', '<C-n>', '<Cmd>NvimTreeOpen<CR>')
vim.keymap.set('n', '<C-n>', '<Cmd>NvimTreeFocus<CR>')
