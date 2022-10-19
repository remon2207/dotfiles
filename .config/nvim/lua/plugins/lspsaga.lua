local status, saga = pcall(require, "lspsaga")

if not status then
    return
end

-- use default config
saga.init_lsp_saga({
    symbol_in_winbar = {
        enable = true
    },
    code_action_lightbulb = {
        virtual_text = false,
    },
})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "<Leader>rn", "<cmd>Lspsaga rename<CR>", opts)
-- vim.keymap.set("n", "gpd", "<cmd>Lspsaga preview_definition<CR>", opts)
vim.keymap.set("n", "gpd", "<cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "<Leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

-- jump diagnostic
-- or jump to error
vim.keymap.set("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)
vim.keymap.set("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)
-- or use command
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
