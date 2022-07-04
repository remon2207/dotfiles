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
                -- {
                --     key = 'l',
                --     action = 'edit_in_place'
                -- },
                -- {
                --     key = 'h',
                --     action = 'close_node'
                -- }
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

-- vim.keymap.set('n', '<C-n>', ':lua require("nvim-tree").open_replacing_current_buffer()<CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<C-n>', '<Cmd>NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })