local status, null_ls = pcall(require, 'null-ls')

if not status then
  return
end

local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local lsp = vim.lsp
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

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
      -- extra_args = { '--cache', '--ignore-pattern', '${HOME}/.config/nvim/utils/linter-config/.prettierrc.js' },
    }),
    code_actions.eslint_d.with({
      extra_args = { '--cache' },
    }),
    code_actions.shellcheck,
    formatting.eslint_d.with({
      extra_args = { '--cache' },
    }),
    formatting.prettierd.with({
      extra_args = {
        '--end-of-line=lf',
        '--print-width=120',
        '--single-quote',
        '--cache',
      },
    }),
    formatting.stylua.with({
      extra_args = {
        '--column-width',
        120,
        '--line-endings',
        'Unix',
        '--indent-type',
        'Spaces',
        '--indent-width',
        2,
        '--quote-style',
        'AutoPreferSingle',
      },
    }),
    formatting.shfmt.with({
      extra_args = { '--indent', 2, '--space-redirects', '--case-indent', '--binary-next-line' },
      filetypes = { 'sh', 'zsh' },
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          vim.lsp.buf.format()
        end,
      })
    end
  end,
})
