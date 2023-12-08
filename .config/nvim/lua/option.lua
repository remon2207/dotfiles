local o = vim.opt
local g = vim.g

-- 文字コード
vim.scriptencoding = 'utf-8'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.fileencodings = { 'utf-8', 'cp932', 'ucs-boms', 'euc-jp' }
o.fileformats = { 'unix', 'dos', 'mac' }
-- レジスタとクリップボードを共有
o.clipboard = 'unnamedplus'
-- インデント
o.expandtab = true
o.autoindent = true
-- smartindent = true
o.smarttab = true
o.tabstop = 2
o.shiftwidth = 2
-- 大文字小文字を区別しない
o.ignorecase = true
o.smartcase = true
-- 行数を表示
o.number = true
-- 相対行にする
o.relativenumber = true
-- カーソル行をハイライトする
o.cursorline = true
-- Enable backspace key
o.backspace = { 'indent', 'eol', 'start' }
-- ステータスを表示
o.laststatus = 2
o.cmdheight = 1
-- 現在のモードを非表示
o.showmode = false
-- Sh command you hit
o.showcmd = true
-- Sh current position on status line
o.ruler = true
-- swapファイルを無効化
o.swapfile = false
-- 検索結果をハイライトする
o.hlsearch = true
o.background = 'dark'
o.termguicolors = true
o.completeopt = { 'menu', 'menuone', 'noselect' }
-- Priity of help language
o.helplang = { 'ja', 'en' }
-- Center the cursor line
o.scrolloff = 5
o.sidescrolloff = 5
-- Pup window the background opacity
o.wildoptions = 'pum'
o.pumblend = 25
-- 常にサインカラムを表示
o.signcolumn = 'yes'
o.autoread = true
o.list = true
o.listchars = 'tab:> ,space: '
o.wrap = false
-- Cfirm dialog on close
o.confirm = true
-- ターミナルモードのシェル
o.shell = 'zsh'
o.wildignore:append({'*/node_modules/*'})
o.mouse:remove({ 'n', 'v', 'i' })
-- リーダー
g.mapleader = ' '

-- build in plugins
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_python3_provider = 0
