local saga = require('lspsaga')

-- use default config
saga.init_lsp_saga {
    code_action_lightbulb = {
        virtual_text = false
    }
}

-- vim.keymap.set("n", "<Leader>ft", "<cmd>Lspsaga open_floaterm<CR>", { silent = true,noremap = true })
