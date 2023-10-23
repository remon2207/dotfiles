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
local handlers = vim.lsp.handlers
local keymap = vim.keymap
local api = vim.api

keymap.set('n', '<Leader>q', '<Cmd>Telescope diagnostics bufnr=0<CR>', { noremap = true, silent = true })

api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    local client = lsp.get_client_by_id(ev.data.client_id)
    local popup_opts = {
      border = 'rounded',
    }

    keymap.set('i', '<C-x><C-o>', '<Cmd>lua require("cmp").complete()<CR>', opts)
    keymap.set('n', 'gD', lsp.buf.declaration, opts)
    keymap.set('n', 'gi', '<Cmd>Telescope lsp_implementations<CR>', opts)
    keymap.set('n', '<space>wa', lsp.buf.add_workspace_folder, opts)
    keymap.set('n', '<space>wr', lsp.buf.remove_workspace_folder, opts)
    keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    keymap.set('n', '<Leader>D', '<Cmd>Telescope lsp_type_definitions<CR>', opts)
    keymap.set('n', 'gr', '<Cmd>Telescope lsp_references<CR>', opts)
    keymap.set('n', '<space>f', function()
      lsp.buf.format({ async = true })
    end, opts)

    local lsp_formatting = function()
      lsp.buf.format({
        async = true,
        filter = function()
          if client.name == 'prismals' then
            return client.name
          end
        end,
      })
    end

    client.server_capabilities.semanticTokensProvider = nil

    if client.name == 'tsserver' then
      client.server_capabilities.documentFormattingProvider = false
    elseif client.name == 'lua_ls' then
      client.server_capabilities.documentFormattingProvider = false
    elseif client.name == 'prismals' then
      vim.keymap.set('n', '<Leader>a', function()
        lsp_formatting()
      end, opts)
    end

    lsp.handlers['textDocument/hover'] = lsp.with(handlers.hover, popup_opts)
    lsp.handlers['textDocument/signatureHelp'] = lsp.with(handlers.signature_help, popup_opts)
    lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
      update_in_insert = true,
      virtual_text = true,
      signs = true,
      severity_sort = true,
      float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    })

    -- vim.diagnostic.config({
    --   virtual_text = true,
    --   severity_sort = true,
    --   sign = true,
    --   float = {
    --     border = 'rounded',
    --     source = 'always',
    --     header = '',
    --     prefix = '',
    --   },
    -- })
  end,
})

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
  'efm',
  'bashls',
  'jsonls',
  'stylelint_lsp',
  'docker_compose_language_service',
  'nil_ls',
}

mason.setup()

mason_lspconfig.setup({
  ensure_installed = servers,
})

local eslint = {
  lintCommand = 'eslint_d --cache -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { '%f:%l:%c: %m' },
  formatCommand = 'eslint_d --cache --fix-to-stdout --stdin --stdin-filename ${INPUT}',
  formatStdin = true,
}

mason_lspconfig.setup_handlers({
  function()
    lspconfig['tsserver'].setup({
      capabilities = capabilities,
      init_options = {
        preferences = {
          importModuleSpecifierPreference = 'non-relative',
        },
      },
    })
    lspconfig['lua_ls'].setup({
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
      capabilities = capabilities,
    })
    lspconfig['docker_compose_language_service'].setup({
      capabilities = capabilities,
    })
    lspconfig['yamlls'].setup({
      capabilities = capabilities,
    })
    lspconfig['tailwindcss'].setup({
      capabilities = capabilities,
    })
    lspconfig['cssls'].setup({
      capabilities = capabilities,
      settings = {
        css = {
          validate = false,
        },
      },
    })
    lspconfig['vimls'].setup({
      capabilities = capabilities,
    })
    lspconfig['prismals'].setup({
      capabilities = capabilities,
    })
    lspconfig['graphql'].setup({
      capabilities = capabilities,
      filetypes = { 'graphql', 'gql', 'typescriptreact', 'javascriptreact' },
    })
    lspconfig['taplo'].setup({
      capabilities = capabilities,
    })
    lspconfig['bashls'].setup({
      capabilities = capabilities,
      filetypes = { 'sh', 'zsh' },
    })
    lspconfig['jsonls'].setup({
      capabilities = capabilities,
    })
    lspconfig['stylelint_lsp'].setup({
      capabilities = capabilities,
    })
    lspconfig['nil_ls'].setup({
      capabilities = capabilities,
    })
    lspconfig['efm'].setup({
      settings = {
        languages = {
          typescript = { eslint },
          javascript = { eslint },
          typescriptreact = { eslint },
          javascriptreact = { eslint },
        },
      },
    })
  end,
})
