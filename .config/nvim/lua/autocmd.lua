local api = vim.api
local o = vim.opt
local autocmd = api.nvim_create_autocmd

api.nvim_create_augroup('file', {})

autocmd('FileType', {
  pattern = '*',
  group = 'file',
  callback = function()
    o.formatoptions:remove({ 'r', 'o' })
  end,
})

autocmd('InsertLeave', {
  pattern = '*',
  group = 'file',
  callback = function()
    if os.execute('fcitx5-remote &> /dev/null') then
      vim.cmd([[call system('fcitx5-remote -c')]])
    end
  end,
})

-- autocmd({ 'BufNewFile', 'BufRead' }, {
--   pattern = '*.{graphql,prisma}',
--   group = 'file',
--   command = 'setlocal smartindent',
-- })

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '{ts,js}config.json',
  group = 'file',
  command = 'setlocal filetype=jsonc',
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '/var/tmp/fstab.*',
  group = 'file',
  command = 'setlocal filetype=fstab',
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '/var/tmp/*.{service,network}',
  group = 'file',
  command = 'setlocal filetype=systemd',
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '/var/tmp/*.conf',
  group = 'file',
  command = 'setlocal filetype=conf',
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.ebuild',
  group = 'file',
  command = 'setlocal tabstop=4 shiftwidth=4 noexpandtab',
})
