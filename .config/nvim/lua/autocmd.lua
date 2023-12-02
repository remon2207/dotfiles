local api = vim.api
local opt = vim.opt
local nvim_create_autocmd = api.nvim_create_autocmd

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
  group = 'file',
  callback = function()
    if os.execute('fcitx5 &> /dev/null') then
      api.nvim_exec('call system("fcitx5-remote -c")', true)
    end
  end,
})

nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.{graphql,prisma}',
  group = 'file',
  command = 'setlocal smartindent',
})

nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '{ts,js}config.json',
  group = 'file',
  command = 'setlocal ft=jsonc',
})

nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '/var/tmp/fstab.*',
  group = 'file',
  command = 'setlocal ft=fstab',
})

nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '/var/tmp/*.{service,network}',
  group = 'file',
  command = 'setlocal ft=systemd',
})

nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '/var/tmp/*.conf',
  group = 'file',
  command = 'setlocal ft=conf',
})

nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.ebuild',
  group = 'file',
  command = 'setlocal tabstop=4 shiftwidth=4 noexpandtab',
})
