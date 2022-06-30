-- require('impatient')
require('default-plugin-skip')

vim.g.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin.lua source <afile> | PackerCompile
  augroup end
]])

vim.g.mapleader = ' '

require('plugin')
require('option')
require('setting')
require('autocmd')
require('keymap')
require('color')
