local opt = vim.opt

-- 文字コード
vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.fileencodings = { 'utf-8', 'cp932', 'ucs-boms', 'euc-jp' }
opt.fileformats = { 'unix', 'dos', 'mac' }
-- Share of register and clipboard
opt.clipboard = 'unnamedplus'
-- Indent
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.tabstop = 2
opt.shiftwidth = 2
-- Case insensitive
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = false
-- Show number
opt.number = true
-- Relative line
opt.relativenumber = true
-- Highlight cursor line
opt.cursorline = true
-- Enable backspace key
opt.backspace = { 'indent', 'eol', 'start' }
-- Show always status line
opt.laststatus = 2
opt.cmdheight = 1
-- Show current mode
opt.showmode = false
-- Show command you hit
opt.showcmd = true
-- Show current position on status line
opt.ruler = true
-- swapファイルを無効化
opt.swapfile = false
-- 検索結果をハイライトする
opt.hlsearch = true
opt.background = 'dark'
opt.termguicolors = true
opt.completeopt = { 'menu', 'menuone', 'noselect' }
-- Priority of help language
opt.helplang = { 'ja', 'en' }
-- Center the cursor line
opt.scrolloff = 5
opt.sidescrolloff = 5
-- Popup window the background opacity
opt.wildoptions = 'pum'
opt.pumblend = 25
-- Show always sign column
opt.signcolumn = 'yes'
opt.autoread = true
opt.list = true
--opt.listchars = 'tab:> '
-- leader
vim.g.mapleader = ' '
opt.wildignore:append({ '*/node_modules/*' })
opt.wrap = false
-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.cmd([[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]])
vim.cmd([[let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"]])
-- 256 color
vim.cmd([[set t_Co=256]])
-- Confirm dialog on close
opt.confirm = true
opt.mouse:remove({ 'n', 'i', 'c', 'r', 'v' })
