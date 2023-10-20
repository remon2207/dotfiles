local status, lint = pcall(require, 'lint')
if not status then
  return
end

parser = require('lint.parser').from_errorformat(errorformat)

-- lint.linters.eslint_d = {
--   cmd = 'eslint_d',
--   args = {
--     '--stdin',
--     '--stdin-filename',
--     function()
--       return vim.api.nvim_buf_get_name(0)
--     end,
--   },
--   parser = parser,
--   -- append_fname = true,
--   -- stream = 'stderr',
-- }

lint.linters.cspell = {
  cmd = 'cspell',
  args = {
    -- '--language-id',
    -- 'typescript',
    '-c',
    '/home/remon/.config/cspell/cspell.json',
    '--',
    '-',
  },
  -- stdin = true,
  parser = parser,
  -- append_fname = true,
  -- stream = 'stderr',
  ignore_exitcode = false,
}

-- lint.linters_by_ft = {
--   javascript = { 'eslint_d' },
--   typescript = { 'eslint_d' },
--   javascriptreact = { 'eslint_d' },
--   typescriptreact = { 'eslint_d' },
-- }

lint.linters_by_ft = {
  lua = { 'cspell' },
  typescript = { 'cspell' },
}

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' }, {
  callback = function()
    lint.try_lint()
  end,
})
