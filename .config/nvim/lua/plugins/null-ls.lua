local null_ls = require('null-ls')
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

null_ls.setup {
    sources = {
        diagnostics.eslint_d.with {
            diagnostics_format = "[#{c}] #{m} (#{s})"
        },
        code_actions.eslint_d,
        formatting.eslint_d,
        formatting.prettierd,
    },
    on_attach = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function() vim.lsp.buf.formatting_seq_sync() end
        })
    end
}
