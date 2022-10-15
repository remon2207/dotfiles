local status, telescope = pcall(require, "telescope")
if not status then
    return
end

local a = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
    defaults = {
        initial_mode = "normal",
        file_ignore_patterns = { "/.git/", "/node_modules/" },
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

local ex_fb = require("telescope").extensions.file_browser

vim.keymap.set("n", "<C-n>", ":Telescope file_browser<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", function()
    ex_fb.file_browser({
        respect_gitignore = false,
    })
end, { noremap = true, silent = true })
