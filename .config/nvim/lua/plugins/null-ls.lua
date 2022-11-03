local status, null_ls = pcall(require, 'null-ls')
if not status then
  return
end

local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

local lsp_formatting = function()
  vim.lsp.buf.format({
    async = true,
    filter = function(client)
      return client.name == 'null-ls'
    end,
  })
end

null_ls.setup({
  sources = {
    diagnostics.eslint_d.with({
      diagnostics_format = '[#{c}] #{m} (#{s})',
      extra_args = { '--cache', '--ignore-pattern', '${HOME}/.config/nvim/utils/linter-config/.prettierrc.js' },
    }),
    code_actions.eslint_d.with({
      extra_args = { '--cache' },
    }),
    formatting.eslint_d.with({
      extra_args = { '--cache' },
    }),
    formatting.prettierd.with({
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand('${HOME}/.config/nvim/utils/linter-config/.prettierrc.js'),
      },
    }),
    formatting.stylua,
    formatting.shfmt.with({
      extra_args = { '--indent', '2', '--space-redirects' },
    }),
  },
  on_attach = function(client)
    if client.supports_method('textDocument/formatting') then
      vim.keymap.set('n', '<Leader>a', function()
        lsp_formatting()
      end, { noremap = true, silent = true })
    end
  end,
})
