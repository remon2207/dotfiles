local saga = require('lspsaga')

-- use default config
saga.init_lsp_saga {
    code_action_lightbulb = {
        virtual_text = false
    }
}

vim.keymap.set("n", "<space>e", "<cmd>Lspsaga show_line_diagnostics<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<space>rn", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { noremap = true, silent = true })
