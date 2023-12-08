local o = vim.opt
local g = vim.g
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local api = vim.api
local hl = api.nvim_set_hl
local autocmd = api.nvim_create_autocmd

-- グローバルオプション
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

-- オプション
-- 文字コード
vim.scriptencoding = 'utf-8'
o.fileencoding = 'utf-8'
o.fileencodings = { 'utf-8', 'cp932', 'ucs-boms', 'euc-jp' }
o.fileformats:append({ 'mac' })
-- レジスタとクリップボードの共有
o.clipboard:append({'unnamedplus'})
-- インデント
o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
-- 大文字小文字の区別をしない
o.ignorecase = true
o.smartcase = true
-- ステータスラインとを表示
o.laststatus = 1
-- 現在のモードを非表示にする
o.showmode = false
o.termguicolors = true
o.completeopt = { 'menu', 'menuone', 'noselect' }
-- Priority of help language
o.helplang:append({ 'en' })
-- Center the cursor line
o.scrolloff = 5
o.sidescrolloff = 5
-- Popup window the background opacity
o.wildoptions:remove({ 'tagfile' })
o.pumblend = 25
-- Show always sign column
o.signcolumn = 'no'
o.list = true
o.listchars = 'tab:> ,space: '
o.mouse:remove({ 'n', 'v', 'i' })
-- リーダー
g.mapleader = ' '

-- キーバインド
keymap('n', '<Esc><Esc>', '<Cmd>set nohlsearch!<CR>', opts)
keymap('n', 'm', '<Nop>', opts)
keymap({ 'n', 'v' }, 'q', '<Nop>', opts)
keymap('n', '<C-z>', '<Nop>', opts)
keymap('n', 'i', '<Nop>', opts)
keymap('n', '<S-i>', '<Nop>', opts)
keymap('n', 'a', '<Nop>', opts)
keymap('n', '<S-a>', '<Nop>', opts)
keymap('n', 'q', '<Cmd>q<CR>', opts)

-- 自動コマンド
autocmd('TermOpen', {
  pattern = '*',
  command = 'normal G',
})

-- ハイライト
hl(0, 'Search', { bg = '#000000', bold = true })
hl(0, 'Visual', { fg = '#586e75', bg = '#002b36', reverse = true })
hl(0, 'Error', { fg = '#dc322f', bg = '#002b36' })
hl(0, 'ErrorMsg', { fg = '#dc322f', bg= '#002b36' })
