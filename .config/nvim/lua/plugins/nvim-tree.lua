require('nvim-tree').setup {
    sort_by = 'case_sensitive',
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    view = {
        centralize_selection = true,
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
                {
                    key = 'o',
                    action = ''
                },
                {
                    key = 'l',
                    action = 'edit'
                },
                {
                    key = 'h',
                    action = 'close_node'
                }
            },
        },
    },
    git = {
        ignore = false
    }
}
vim.keymap.set('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
