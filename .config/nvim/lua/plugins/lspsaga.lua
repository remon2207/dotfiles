local saga = require('lspsaga')

-- use default config
saga.init_lsp_saga {
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>", -- quit can be a table
    },
    code_action_lightbulb = {
        virtual_text = false
    }
}
local action = require("lspsaga.action")
-- scroll down hover doc or scroll in definition preview
vim.keymap.set("n", "<C-f>", function()
    action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll up hover doc
vim.keymap.set("n", "<C-b>", function()
    action.smart_scroll_with_saga(-1)
end, { silent = true })

vim.keymap.set("n", "K", require("lspsaga.hover").render_hover_doc, { silent = true })
vim.keymap.set("n", "gd", require("lspsaga.definition").preview_definition, { silent = true,noremap = true })
