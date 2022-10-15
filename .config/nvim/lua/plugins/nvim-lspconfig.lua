local api = vim.api
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local prisma_lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        async = true,
        filter = function(client)
            return client.name == "prismals"
        end,
        bufnr = bufnr,
    })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    -- client.resolved_capabilities.document_formatting = false
    -- client.server_capabilities.document_formatting = false

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
    elseif client.name == "sumneko_lua" then
        client.server_capabilities.documentFormattingProvider = false
    elseif client.name == "prismals" then
        vim.keymap.set("n", "<Leader>fa", function()
            prisma_lsp_formatting(bufnr)
        end, bufopts)
    end

    -- api.nvim_create_autocmd('BufWritePre', {
    -- pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
    -- group = 'file',
    -- command = 'EslintFixAll'
    -- })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

-- local servers = {
--     'tsserver',
--     'eslint',
-- 'sumneko_lua',
--     'dockerls',
--     'yamlls',
--     'sqls',
--     'tailwindcss',
--     'bashls',
--     'vimls',
--     'prismals',
--     'graphql',
--     'cssls',
--     'stylelint_lsp'
-- }
local servers = {
    "tsserver",
    -- "sumneko_lua",
    "sumneko_lua",
    "dockerls",
    -- 'eslint',
    "yamlls",
    "sqlls",
    "sqls",
    "tailwindcss",
    -- 'cssls',
    -- 'stylelint_lsp',
    "vimls",
    "prismals",
    "graphql",
    -- "bashls",
}

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = servers,
})
mason_lspconfig.setup_handlers({
    function(servers)
        require("lspconfig")[servers].setup({
            on_attach = on_attach,
            flags = lsp_flags,
            capabilities = capabilities,
        })
    end,
})

-- for _, lsp in pairs(servers) do
--     require('lspconfig')[lsp].setup {
--         on_attach = on_attach,
--         flags = lsp_flags,
--         capabilities = capabilities,
--     }
-- end
