local opt = vim.opt

-- Character code
opt.fileencoding = 'utf-8'
opt.fileencodings = { 'utf-8', 'cp932', 'ucs-boms', 'euc-jp' }
opt.fileformats = { 'unix', 'dos', 'mac' }
-- Share of register and clipboard
opt.clipboard:append({ 'unnamed', 'unnamedplus' })
-- Indent
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.tabstop = 4
opt.shiftwidth = 4
-- Case insensitive
opt.ignorecase = true
opt.smartcase = true
-- Show number
opt.number = true
-- Relative line
-- opt.relativenumber = true
-- Highlight cursor line
opt.cursorline = true
-- opt.cursorcolumn = true
-- Enable backspace key
opt.backspace = { 'indent', 'eol', 'start' }
-- Show always status line
opt.laststatus = 1
-- Show current mode
opt.showmode = false
-- Show command you hit
opt.showcmd = true
-- Show current position on status line
opt.ruler = true
-- Disable swap file
opt.swapfile = false

opt.hlsearch = false

opt.background = 'dark'
opt.termguicolors = true

opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Priority of help language
opt.helplang = { 'ja', 'en' }

-- Center the cursor line
-- opt.scrolloff = 999

-- Popup window the background opacity
-- opt.winblend = 100
-- opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 10

-- Show always sign column
opt.signcolumn = 'yes'

opt.autoread = true

opt.list = true
opt.listchars = 'tab:> '

opt.wildignore:append({ '*/node_modules/*' })

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.cmd([[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]])
vim.cmd([[let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"]])

-- 256 color
vim.cmd([[set t_Co=256]])

-- Confirm dialog on close
opt.confirm = true

-- Cursor style
-- opt.guicursor = {
--     i = 'block',
-- }
opt.mouse:remove({ 'n', 'i', 'c', 'r', 'v' })

opt.shada:remove({ '!', "'100", '<50', 's10', 'h' })
