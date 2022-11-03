local api = vim.api
local status, util = pcall(require, 'formatter.util')
if not status then
  return
end

util.setup({
  filetype = {
    typescriptreact = {
      require('formatter.filetypes.typescriptreact').prettier,
    },
    typescript = {
      require('formatter.filetypes.typescript').prettier,
    },
  },
})

api.nvim_create_autocmd('BufWritePre', {
  pattern = {
    '*.js',
    '*.jsx',
    '*.ts',
    '*.tsx',
    '*.css',
    '*.scss',
    '*.sass',
    '*.json',
    '*.graphql',
    '*.md',
    '*.yaml',
    '*.html',
  },
  group = 'file',
  command = 'FormatWrite',
})
