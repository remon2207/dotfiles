local status, tree = pcall(require, 'nvim-tree')
if not status then
    return
end

tree.setup({
    sort_by = 'case_sensitive',
    disable_netrw = true,
    open_on_setup = true,
    -- actions = {
    --     open_file = {
    --         quit_on_open = true,
    --     },
    -- },
    view = {
        -- centralize_selection = true,
        hide_root_folder = true,
        mappings = {
            list = {
                {
                    key = '<C-e>',
                    action = '',
                },
                {
                    key = 'h',
                    action = 'close_node',
                },
                {
                    key = 'l',
                    action = 'edit',
                },
                {
                    key = "f",
                    action = "",
                },
                {
                    key = "<C-_>",
                    action = "live_filter",
                },
                {
                    key = "s",
                    action = "",
                },
                {
                    key = "<C-x>",
                    action = "",
                },
                {
                    key = "ss",
                    action = "split",
                },
                {
                    key = "<C-v>",
                    action = "",
                },
                {
                    key = "sv",
                    action = "vsplit",
                },
            },
        },
    },
    git = {
        ignore = false,
    },
})

vim.keymap.set('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-a-n>', '<Cmd>NvimTreeFocus<CR>', { noremap = true, silent = true })
