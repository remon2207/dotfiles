local g = vim.g
local o = vim.opt
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local api = vim.api
local nvim_create_autocmd = api.nvim_create_autocmd

g.did_install_default_menus = 0
g.did_install_syntax_menu = 0
g.did_indent_on = 0
g.did_load_ftplugin = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_python3_provider = 0
g.loaded_2html_plugin = 0
g.loaded_getscript = 0
g.loaded_getscriptPlugin = 0
g.loaded_gzip = 0
g.loaded_logiPat = 0
g.loaded_logipat = 0
g.loaded_man = 0
g.loaded_matchit = 0
g.loaded_matchparen = 0
g.loaded_netrw = 0
g.loaded_netrwFileHandlers = 0
g.loaded_netrwPlugin = 0
g.loaded_netrwSettings = 0
g.loaded_remote_plugins = 0
g.loaded_rrhelper = 0
g.loaded_shada_plugin = 0
g.loaded_spellfile_plugin = 0
g.loaded_sql_completion = 0
g.loaded_tar = 0
g.loaded_tarPlugin = 0
g.loaded_tutor_mode_plugin = 0
g.loaded_vimball = 0
g.loaded_vimballPlugin = 0
g.loaded_zip = 0
g.loaded_zipPlugin = 0
g.skip_loading_mswin = 0
g.vimsyn_embed = 0

-- 文字コード
vim.scriptencoding = 'utf-8'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.fileencodings = { 'utf-8', 'cp932', 'ucs-boms', 'euc-jp' }
o.fileformats = { 'unix', 'dos', 'mac' }
-- Share of register and clipboard
o.clipboard = 'unnamedplus'
-- Indent
o.expandtab = true
o.autoindent = true
-- o.smartindent = true
o.smarttab = true
o.tabstop = 2
o.shiftwidth = 2
-- Case insensitive
o.ignorecase = true
o.smartcase = true
-- Show number
o.number = false
-- Highlight cursor line
-- o.cursorline = true
o.cursorline = false
-- Enable backspace key
o.backspace = { 'indent', 'eol', 'start' }
-- Show always status line
o.laststatus = 1
o.cmdheight = 1
-- Show current mode
o.showmode = false
-- Show command you hit
o.showcmd = true
-- Show current position on status line
o.ruler = true
-- swapファイルを無効化
o.swapfile = false
-- 検索結果をハイライトする
o.hlsearch = true
o.background = 'dark'
o.termguicolors = true
o.completeopt = { 'menu', 'menuone', 'noselect' }
-- Priority of help language
o.helplang = { 'ja', 'en' }
-- Center the cursor line
o.scrolloff = 5
o.sidescrolloff = 5
-- Popup window the background opacity
o.wildoptions = 'pum'
o.pumblend = 25
-- Show always sign column
o.signcolumn = 'no'
o.autoread = true
o.list = true
o.listchars = 'tab:> ,space: '
-- leader
vim.g.mapleader = ' '
o.wildignore:append({ '*/node_modules/*' })
o.wrap = false
-- Confirm dialog on close
o.confirm = true
o.mouse:remove({ 'n', 'i', 'c', 'r', 'v' })
-- shell of :terminal
o.shell = 'zsh'

keymap.set('n', '<Esc><Esc>', '<Cmd>set nohlsearch!<CR>', opts)
keymap.set('n', 'm', '<Nop>', opts)
keymap.set({ 'n', 'v' }, 'q', '<Nop>', opts)
keymap.set('n', '<C-z>', '<Nop>', opts)
keymap.set('n', 'i', '<Nop>', opts)
keymap.set('n', '<S-i>', '<Nop>', opts)
keymap.set('n', 'a', '<Nop>', opts)
keymap.set('n', '<S-a>', '<Nop>', opts)
keymap.set('n', 'q', '<Cmd>q<CR>', opts)

nvim_create_autocmd('TermOpen', {
  pattern = { '*' },
  command = 'normal G',
})

api.nvim_set_hl(0, 'Search', { bg = '#b8b814', fg = '#000000' })
