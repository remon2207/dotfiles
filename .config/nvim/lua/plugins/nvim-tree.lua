local status, tree = pcall(require, 'nvim-tree')
if not status then
    return
end

tree.setup({
    sort_by = 'case_sensitive',
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    view = {
        -- centralize_selection = true,
        hide_root_folder = true,
        mappings = {
            list = {
                -- {
                --     key = '<C-e>',
                --     action = '',
                -- },
                {
                    key = '<CR>',
                    action = 'edit_in_place',
                },
                {
                    key = 'u',
                    action = 'dir_up',
                },
                {
                    key = 'h',
                    action = 'close_node',
                },
                -- {
                --     key = 'l',
                --     action = 'edit',
                -- },
                {
                    key = 'l',
                    action = 'edit_in_place',
                },
                {
                    key = 'f',
                    action = '',
                },
                {
                    key = '<C-_>',
                    action = 'live_filter',
                },
                {
                    key = 's',
                    action = '',
                },
                {
                    key = '<C-x>',
                    action = '',
                },
                {
                    key = 'ss',
                    action = 'split',
                },
                {
                    key = '<C-v>',
                    action = '',
                },
                {
                    key = 'sv',
                    action = 'vsplit',
                },
            },
        },
    },
    git = {
        ignore = false,
    },
})

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', opts)
-- vim.keymap.set('n', '<C-n>', '<Cmd>NvimTreeFocus<CR>', { noremap = true, silent = true })

local function toggle_replace()
    local view = require('nvim-tree.view')
    if view.is_visible() then
        view.close()
    else
        tree.open_replacing_current_buffer()
    end
end

vim.keymap.set('n', '<C-n>', function()
    toggle_replace()
end, opts)
