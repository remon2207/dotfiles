local telescope = require("telescope")
local a = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

-- require('telescope').setup {
telescope.setup({
    defaults = {
        initial_mode = "normal",
        file_ignore_patterns = { "/.git/" },
        vimgrep_arguments = {
            "rg",
            "--color=auto",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
        },
        mappings = {
            i = {
                ["<Esc><Esc>"] = a.close,
                -- ['<C-n>'] = false,
                -- ['<C-p>'] = false,
                ["<C-j>"] = a.move_selection_next,
                ["<C-k>"] = a.move_selection_previous,
                ["<C-o>"] = false,
            },
            n = {
                ["q"] = a.close,
                ["o"] = false,
                ["N"] = fb_actions.create,
            },
        },
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
            theme = "dropdown",
            hidden = true,
        },
    },
})

vim.keymap.set("n", "<Leader>ff", "<Cmd>Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fb", "<Cmd>Telescope buffers <CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fh", "<Cmd>Telescope help_tags<CR>", { noremap = true, silent = true })

require("telescope").load_extension("file_browser")

vim.api.nvim_set_keymap("n", "<C-n>", ":Telescope file_browser<CR>", { noremap = true, silent = true })
