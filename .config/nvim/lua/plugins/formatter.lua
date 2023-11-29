local status, formatter = pcall(require, 'formatter')
if not status then
  return
end

local api = vim.api
local ft = require('formatter.filetypes')

local function shfmt()
  return {
    exe = 'shfmt',
    args = {
      '-sr',
      '-i',
      '2',
    },
    stdin = true,
  }
end

local function stylua()
  return {
    exe = 'stylua',
    args = {
      '--column-width',
      '120',
      '--line-endings',
      'Unix',
      '--indent-type',
      'Spaces',
      '--indent-width',
      '2',
      '--quote-style',
      'AutoPreferSingle',
    },
  }
end

formatter.setup({
  filetype = {
    typescript = ft.typescript.prettierd,
    javascript = ft.javascript.prettierd,
    typescriptreact = ft.typescriptreact.prettierd,
    javascriptreact = ft.javascriptreact.prettierd,
    css = ft.css.prettierd,
    yaml = ft.yaml.yamlfmt,
    lua = stylua,
    sh = shfmt,
    zsh = shfmt,
  },
})

api.nvim_create_autocmd('BufWritePost', {
  pattern = { '*.sh', '*.zsh', '.profile', '.bash*' },
  command = 'FormatWrite',
})
