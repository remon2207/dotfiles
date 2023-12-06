local api = vim.api
local opt = vim.opt
local autocmd = api.nvim_create_autocmd

api.nvim_create_augroup('file', {})

autocmd('FileType', {
  pattern = '*',
  group = 'file',
  callback = function()
    opt.formatoptions:remove({ 'r', 'o' })
  end,
})

autocmd('InsertLeave', {
  pattern = '*',
  group = 'file',
  callback = function()
    if os.execute('fcitx5 &> /dev/null') then
      api.nvim_exec('call system("fcitx5-remote -c")', true)
    end
  end,
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.{graphql,prisma}',
  group = 'file',
  command = 'setlocal smartindent',
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '{ts,js}config.json',
  group = 'file',
  command = 'setlocal ft=jsonc',
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '/var/tmp/fstab.*',
  group = 'file',
  command = 'setlocal ft=fstab',
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '/var/tmp/*.{service,network}',
  group = 'file',
  command = 'setlocal ft=systemd',
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '/var/tmp/*.conf',
  group = 'file',
  command = 'setlocal ft=conf',
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.ebuild',
  group = 'file',
  command = 'setlocal tabstop=4 shiftwidth=4 noexpandtab',
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.rasi',
  group = 'file',
  command = 'setlocal ft=rasi',
})
