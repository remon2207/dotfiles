local telescope = require('telescope')
local a = require('telescope.actions')

-- require('telescope').setup {
telescope.setup {
    defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          '--hidden'
        },
        mappings = {
            i = {
                ['<Esc>'] = a.close,
                ['<C-n>'] = false,
                ['<C-p>'] = false,
                ['<C-j>'] = a.move_selection_next,
                ['<C-k>'] = a.move_selection_previous
            }
        }
    }
}




vim.keymap.set('n', '<Leader>ff', '<Cmd>Telescope find_files hidden=true<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fb', '<Cmd>Telescope buffers <CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fh', '<Cmd>Telescope help_tags<CR>', { noremap = true, silent = true })
