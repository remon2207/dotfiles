local status, mason = pcall(require, 'mason')
if not status then
  return
end

local status2, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status2 then
  return
end

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
