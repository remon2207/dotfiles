local status, null_ls = pcall(require, "null-ls")
if not status then
    return
end

local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        async = true,
        filter = function(client)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

null_ls.setup({
    sources = {
        diagnostics.eslint_d.with({
            diagnostics_format = "[#{c}] #{m} (#{s})",
            extra_args = { "--cache" },
        }),
        code_actions.eslint_d.with({
            extra_args = { "--cache" },
        }),
        formatting.eslint_d.with({
            extra_args = { "--cache" },
        }),
        formatting.prettierd,
        formatting.stylua.with({
            extra_args = { "--indent-type", "Spaces" },
        }),
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            -- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            -- vim.api.nvim_create_autocmd("BufWritePre", {
            --     group = augroup,
            --     buffer = bufnr,
            --     callback = function()
            --         lsp_formatting(bufnr)
            --     end,
            -- })
            vim.keymap.set("n", "<Leader>fa", function()
                lsp_formatting(bufnr)
            end, { noremap = true, silent = true })
        end
    end,
})
