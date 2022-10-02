require('default_skip')
require('impatient')

vim.g.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'

vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = { 'plugin.lua' },
    command = 'source <afile> | PackerCompile'
})

vim.g.mapleader = ' '

require('plugin')
require('option')
require('setting')
require('autocmd')
require('keymap')
require('color')
