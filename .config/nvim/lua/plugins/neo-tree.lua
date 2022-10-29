local status, neo_tree = pcall(require, 'neo-tree')
if not status then
    return
end

neo_tree.setup({
    popup_border_style = 'rounded',
    sort_case_insensitive = true,
    default_component_configs = {
        git_status = {
            symbols = {
                -- Change type
                added = '✚', -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
                deleted = '✖', -- this can only be used in the git_status source
                renamed = '', -- this can only be used in the git_status source
                -- Status type
                untracked = '',
                ignored = '',
                unstaged = 'M',
                staged = '',
                conflict = '',
            },
        },
    },
    filesystem = {
        hijack_netrw_behavior = 'open_current',
        filtered_items = {
            visible = true,
            -- hide_dotfiles = false,
            -- hide_gitignored = true,
            -- hide_hidden = false,
            -- hide_by_name = {
            --     'node_modules',
            -- },
            -- hide_by_pattern = {
            --     '**/node_modules/**'
            -- },
            never_show = {
                'node_modules'
            }
        },
    },
})

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<C-n>', '<Cmd>NeoTreeFloat<CR>', opts)
