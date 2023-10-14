local status, mason = pcall(require, 'mason')
if not status then
  return
end

local status2, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status2 then
  return
end

local status3, lspconfig = pcall(require, 'lspconfig')
if not status3 then
  return
end

local lsp = vim.lsp
local handlers = lsp.handlers

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

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('i', '<C-x><C-o>', '<Cmd>lua require("cmp").complete()<CR>', bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

  if client.name == 'tsserver' then
    client.server_capabilities.documentFormattingProvider = false
  elseif client.name == 'lua_ls' then
    client.server_capabilities.documentFormattingProvider = false
  elseif client.name == 'prismals' then
    vim.keymap.set('n', '<Leader>a', function()
      lsp_formatting()
    end, bufopts)
  end

  local popup_opts = {
    border = 'rounded',
  }

  lsp.handlers['textDocument/hover'] = lsp.with(handlers.hover, popup_opts)
  lsp.handlers['textDocument/signatureHelp'] = lsp.with(handlers.signature_help, popup_opts)
  -- lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
  --   update_in_insert = true,
  --   virtual_text = false,
  --   signs = false
  -- })
  lsp.handlers['textDocument/publishDiagnostics'] = function() end

  vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
    -- config = config or {}
    config = popup_opts
    config.focus_id = ctx.method
    if not (result and result.contents) then
      -- vim.notify('No information available')
      return
    end
    local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
    markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
    if vim.tbl_isempty(markdown_lines) then
      -- vim.notify('No information available')
      return
    end
    return vim.lsp.util.open_floating_preview(markdown_lines, 'markdown', config)
  end

  vim.diagnostic.config({
    -- virtual_text = true,
    -- severity_sort = true,
    float = {
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {
  'tsserver',
  'lua_ls',
  'dockerls',
  'yamlls',
  'tailwindcss',
  'cssls',
  'vimls',
  'prismals',
  'graphql',
  'taplo',
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
  function()
    lspconfig['tsserver'].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      init_options = {
        preferences = {
          importModuleSpecifierPreference = "non-relative"
        }
      }
    })
    lspconfig['lua_ls'].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })
    lspconfig['dockerls'].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
    lspconfig['yamlls'].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
    lspconfig['tailwindcss'].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
    lspconfig['cssls'].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
    lspconfig['vimls'].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
    lspconfig['prismals'].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
    lspconfig['graphql'].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { 'graphql', 'gql', 'typescriptreact', 'javascriptreact' },
    })
    lspconfig['taplo'].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
})
