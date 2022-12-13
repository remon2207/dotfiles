local api = vim.api
local opt = vim.opt

api.nvim_create_augroup('file', {})

api.nvim_clear_autocmds({
  pattern = '*',
  group = 'file',
})

api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  group = 'file',
  callback = function()
    opt.formatoptions:remove({ 'r', 'o' })
  end,
})

api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  callback = function()
    if os.execute('fcitx5 > /dev/null 2>&1') then
      api.nvim_exec('call system("fcitx5-remote -c")', true)
    end
  end,
})

-- api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
--   pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', '*.json', '*.yml', '*.vim', '*.prisma', '*.graphql', '*.css' },
--   group = 'file',
--   command = 'setlocal tabstop=2 shiftwidth=2',
-- })

-- api.nvim_create_autocmd({ 'FileType' }, {
--   pattern = { 'xml' },
--   group = 'file',
--   command = 'setlocal tabstop=2 shiftwidth=2',
-- })

api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.graphql', '*.prisma' },
  group = 'file',
  command = 'setlocal nosmartindent',
})

api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { 'tsconfig.json', 'jsconfig.json' },
  group = 'file',
  command = 'setlocal ft=jsonc',
})

api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '/var/tmp/fstab.*',
  group = 'file',
  command = 'setlocal ft=fstab'
})
