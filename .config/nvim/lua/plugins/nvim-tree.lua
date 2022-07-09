require('nvim-tree').setup {
    sort_by = 'case_sensitive',
    disable_netrw = true,
    open_on_setup = true,
    actions = {
        open_file = {
            quit_on_open = true,
        },
        change_dir = {
            enable = false
        }
    },
    view = {
        centralize_selection = true,
        hide_root_folder = true,
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
                },
                {
                    key = 's',
                    action = ''
                },
                {
                    key = '<C-x>',
                    action = ''
                },
                {
                    key = 'ss',
                    action = 'split'
                },
                {
                    key = '<C-v>',
                    action = ''
                },
                {
                    key = 'sv',
                    action = 'vsplit'
                }
            },
        },
    },
    git = {
        ignore = false
    }
}
vim.keymap.set('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
