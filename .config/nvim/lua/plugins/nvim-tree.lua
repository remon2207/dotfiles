require('nvim-tree').setup {
    sort_by = 'case_sensitive',
    view = {
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
    update_focused_file = {
        enable = true
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
}
vim.keymap.set('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
