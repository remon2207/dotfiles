local o = vim.opt
local g = vim.g

-- 文字コード
vim.scriptencoding = 'utf-8'
o.fileencodings = { 'utf-8', 'cp932', 'ucs-boms', 'euc-jp' }
o.fileformats:append({ 'mac' })
-- レジスタとクリップボードを共有
o.clipboard:append({'unnamedplus'})
-- インデント
o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
-- 大文字小文字を区別しない
o.ignorecase = true
o.smartcase = true
-- 相対行にする
o.relativenumber = true
-- カーソル行をハイライトする
o.cursorline = true
-- 現在のモードを非表示
o.showmode = false
-- swapファイルを無効化
o.swapfile = false
o.termguicolors = true
o.completeopt = { 'menu', 'menuone', 'noselect' }
-- Priity of help language
o.helplang:append({ 'en' })
-- Center the cursor line
o.scrolloff = 5
o.sidescrolloff = 5
-- Pup window the background opacity
o.wildoptions:remove({ 'tagfile' })
o.pumblend = 25
-- 常にサインカラムを表示
o.signcolumn = 'yes'
o.list = true
o.listchars = 'tab:> ,space: '
o.wrap = false
-- Confirm dialog on close
o.confirm = true
o.wildignore:append({'*/node_modules/*'})
o.mouse:remove({ 'n', 'v', 'i' })
-- カレントウィンドウの右に開く
o.splitright = true
-- カレントウィンドウの下に開く
o.splitbelow = true
-- リーダー
g.mapleader = ' '

-- build in plugins
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_python3_provider = 0
