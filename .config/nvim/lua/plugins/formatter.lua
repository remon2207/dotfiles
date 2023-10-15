local status, formatter = pcall(require, 'formatter')
if not status then
  return
end

formatter.setup({
  filetype = {
    typescript = {
      require('formatter.filetypes.typescript').prettierd,
    },
    javascript = {
      require('formatter.filetypes.javascript').prettierd,
    },
    typescriptreact = {
      require('formatter.filetypes.typescriptreact').prettierd,
    },
    javascript = {
      require('formatter.filetypes.javascriptreact').prettierd,
    },
    lua = {
      require('formatter.filetypes.lua').stylua,
    },
  },
})

local api = vim.api

api.nvim_create_autocmd('BufWritePost', {
  pattern = {
    -- '*.js',
    -- '*.jsx',
    -- '*.ts',
    -- '*.tsx',
    -- '*.css',
    -- '*.scss',
    -- '*.sass',
    -- '*.json',
    -- '*.graphql',
    -- '*.md',
    -- '*.yaml',
    -- '*.html',
    '*',
  },
  command = 'FormatWrite',
})
