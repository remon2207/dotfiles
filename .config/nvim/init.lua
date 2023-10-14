vim.opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- vim.api.nvim_create_autocmd('BufWritePost', {
--     pattern = { 'plugin.lua' },
--     command = 'source <afile> | PackerCompile',
-- })

vim.g.mapleader = ' '

require('option')
require('plugin')
require('setting')
require('autocmd')
require('keymap')
-- require('command')
require('color')
