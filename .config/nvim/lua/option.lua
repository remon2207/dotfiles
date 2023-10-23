local o = vim.opt

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
o.smartindent = true
o.smarttab = true
o.tabstop = 2
o.shiftwidth = 2
-- Case insensitive
o.ignorecase = true
o.smartcase = true
o.wrapscan = false
-- Show number
o.number = true
-- Relative line
o.relativenumber = true
-- Highlight cursor line
o.cursorline = true
-- Enable backspace key
o.backspace = { 'indent', 'eol', 'start' }
-- Show always status line
o.laststatus = 2
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
o.signcolumn = 'yes'
o.autoread = true
o.list = true
o.listchars = 'tab:> ,space: '
-- leader
vim.g.mapleader = ' '
o.wildignore:append({ '*/node_modules/*' })
o.wrap = false
-- Undercurl
vim.cmd([[
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
]])
-- 256 color
vim.cmd([[set t_Co=256]])
-- Confirm dialog on close
o.confirm = true
o.mouse:remove({ 'n', 'i', 'c', 'r', 'v' })
-- shell of :terminal
o.shell = 'fish'
