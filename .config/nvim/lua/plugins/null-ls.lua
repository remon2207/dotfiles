local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

null_ls.setup({
    sources = {
        diagnostics.eslint_d.with({
            diagnostics_format = "[#{c}] #{m} (#{s})",
        }),
        code_actions.eslint_d,
        formatting.eslint_d,
        formatting.prettier,
        formatting.stylua,
    },
    on_attach = function()
        -- vim.api.nvim_create_autocmd("BufWritePre", {
        --     buffer = 0,
        --     callback = function()
        --         vim.lsp.buf.format({ async = true })
        --     end,
        -- })
        vim.api.nvim_set_keymap(
            "n",
            "<Leader>fa",
            "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>",
            { silent = true }
        )
        -- vim.api.nvim_create_autocmd('BufWritePre', {
        --     pattern = {'*.js', '*.jsx', '*.mjs', '*.ts', '*.tsx', '*.css', '*.less', '*.scss', '*.json', '*.graphql', '*.md', '*.vue', '*.svelte', '*.yaml', '*.html'},
        --     command = 'PrettierAsync'
        -- })
    end,
})
