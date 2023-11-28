local api = vim.api
local nvim_create_autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

api.nvim_create_augroup('file', {})

api.nvim_clear_autocmds({
  pattern = '*',
  group = 'file',
})

nvim_create_autocmd('FileType', {
  pattern = '*',
  group = 'file',
  callback = function()
    opt.formatoptions:remove({ 'r', 'o' })
  end,
})

nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  callback = function()
    if os.execute('fcitx5 &> /dev/null') then
      api.nvim_exec('call system("fcitx5-remote -c")', true)
    end
  end,
})

-- nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
--   pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', '*.json', '*.yml', '*.vim', '*.prisma', '*.graphql', '*.css' },
--   group = 'file',
--   command = 'setlocal tabstop=2 shiftwidth=2',
-- })

-- nvim_create_autocmd({ 'FileType' }, {
--   pattern = { 'xml' },
--   group = 'file',
--   command = 'setlocal tabstop=2 shiftwidth=2',
-- })

nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.graphql', '*.prisma' },
  group = 'file',
  command = 'setlocal smartindent',
})

nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { 'tsconfig.json', 'jsconfig.json' },
  group = 'file',
  command = 'setlocal ft=jsonc',
})

nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '/var/tmp/fstab.*',
  group = 'file',
  command = 'setlocal ft=fstab',
})

nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '/var/tmp/*.{service,network}' },
  group = 'file',
  command = 'setlocal ft=systemd',
})

nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '/var/tmp/*.conf' },
  group = 'file',
  command = 'setlocal ft=conf',
})
