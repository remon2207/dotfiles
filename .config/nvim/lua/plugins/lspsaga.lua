local saga = require('lspsaga')

-- use default config
saga.init_lsp_saga {
    code_action_lightbulb = {
        virtual_text = false
    }
}

vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<Leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "gpd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
vim.keymap.set("n", "<Leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true, noremap= true })

-- jump diagnostic
-- or jump to error
vim.keymap.set("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true, noremap = true })
vim.keymap.set("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true, noremap = true })
-- or use command
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true, noremap = true })

local action = require("lspsaga.action")
-- scroll down hover doc or scroll in definition preview
vim.keymap.set("n", "<C-f>", function()
    action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll up hover doc
vim.keymap.set("n", "<C-b>", function()
    action.smart_scroll_with_saga(-1)
end, { silent = true })
