local status, mason = pcall(require, 'mason')
if not status then
    return
end

local status2, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status2 then
    return
end

local api = vim.api
local lsp = vim.lsp
local handlers = lsp.handlers
local opts = { noremap = true, silent = true }

local lsp_formatting = function()
    vim.lsp.buf.format({
        async = true,
        filter = function(client)
            if client.name == 'prismals' then
                return client.name
            end
        end,
    })
end

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('i', '<C-x><C-o>', '<Cmd>lua require("cmp").complete()<CR>', bufopts)
    vim.keymap.set('n', 'gD', lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', lsp.buf.implementation, bufopts)
    vim.keymap.set({ 'n', 'i' }, '<C-k>', lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', lsp.buf.references, bufopts)

    if client.name == 'tsserver' then
        client.server_capabilities.documentFormattingProvider = false
    elseif client.name == 'sumneko_lua' then
        client.server_capabilities.documentFormattingProvider = false
    elseif client.name == 'prismals' then
        vim.keymap.set('n', '<Leader>fa', function()
            lsp_formatting()
        end, bufopts)
    end

    local popup_opts = {
        border = 'rounded',
    }

    lsp.handlers['textDocument/hover'] = lsp.with(handlers.hover, popup_opts)
    lsp.handlers['textDocument/signatureHelp'] = lsp.with(handlers.signature_help, popup_opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local servers = {
    'tsserver',
    'sumneko_lua',
    'dockerls',
    'yamlls',
    'sqlls',
    'sqls',
    'tailwindcss',
    'cssls',
    'vimls',
    'prismals',
    'graphql',
}

mason.setup({
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
        },
    },
})

mason_lspconfig.setup({
    ensure_installed = servers,
})

mason_lspconfig.setup_handlers({
    function(servers)
        require('lspconfig')[servers].setup({
            on_attach = on_attach,
            flags = lsp_flags,
            capabilities = capabilities,
        })
    end,
})
