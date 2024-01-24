local o = vim.opt
local g = vim.g

-- ビルトインプラグインを無効化
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_python3_provider = 0

-- 文字コード
vim.scriptencoding = 'utf-8'
o.fileencodings = { 'utf-8', 'cp932', 'ucs-boms', 'euc-jp' }
o.fileformats:append({ 'mac' })
-- レジスタとクリップボードを共有
o.clipboard:append({ 'unnamedplus' })
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
-- ヘルプ言語の優先度
o.helplang:append({ 'en' })
-- カーソル行周囲に余裕を持たせる
o.scrolloff = 5
o.sidescrolloff = 5
-- o.wildoptions:remove({ 'tagfile' })
-- ポップアップウィンドウの背景の不透明度
o.pumblend = 25
-- 常にサインカラムを表示
o.signcolumn = 'yes'
o.list = true
o.listchars = 'tab:> ,space: '
o.wrap = false
-- 終了時に確認ダイアログを表示
o.confirm = true
o.wildignore:append({ '*/node_modules/*' })
o.mouse:remove({ 'n', 'v', 'i' })
-- カレントウィンドウの右に開く
o.splitright = true
-- カレントウィンドウの下に開く
o.splitbelow = true

-- リーダー
g.mapleader = ' '
