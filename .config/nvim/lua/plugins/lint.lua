local status, lint = pcall(require, 'lint')
if not status then
  return
end

parser = require('lint.parser').from_errorformat(errorformat)

lint.linters.eslint_d = {
  cmd = 'eslint_d',
  args = {
    '--fix',
  },
  parser = parser,
  append_fname = true,
  stream = 'stderr',
}

lint.linters_by_ft = {
  javascript = { 'eslint_d' },
  typescript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
}

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' }, {
  callback = function()
    lint.try_lint()
  end,
})
