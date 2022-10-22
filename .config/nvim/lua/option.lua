local opt = vim.opt

-- 保存時の文字コード
opt.fileencoding = 'utf-8'
-- 読み込み時の文字コードの自動判別. 左側が優先される
opt.fileencodings = { 'utf-8', 'cp932', 'ucs-boms', 'euc-jp' }
-- 改行コードの自動判別. 左側が優先される
opt.fileformats = { 'unix', 'dos', 'mac' }
-- レジスタ、クリップボードの共有
opt.clipboard:append({ 'unnamed', 'unnamedplus' })
-- タブ入力を複数の空白入力に置き換える
opt.expandtab = true
-- 画面上でタブ文字が占める幅
-- 改行時に前の行のインデントを継続する
opt.autoindent = true
opt.smartindent = true
-- opt.breakindent = true
-- opt.cindent = true
-- 改行時に前の行の構文をチェックし次の行のインデントを増減する
opt.smarttab = true
-- smartindentで増減する幅
opt.tabstop = 4
opt.shiftwidth = 4
-- インクリメンタルサーチ. １文字入力毎に検索を行う
-- opt.incsearch = true
-- 検索パターンに大文字小文字を区別しない
opt.ignorecase = true
-- 検索パターンに大文字を含んでいたら大文字小文字を区別する
-- opt.smartcase = true
-- 一番下の単語まで行ったら一番上に戻る
-- opt.wrapscan = true
-- 行数表示
opt.number = true
-- 相対行
opt.relativenumber = true
-- カーソルラインをハイライト
opt.cursorline = true
-- opt.cursorcolumn = true
-- バックスペースキーの有効化
opt.backspace = { 'indent', 'eol', 'start' }
-- コマンドモードの補完
-- opt.wildmenu = true
-- ステータスラインを常に表示
opt.laststatus = 1
-- 現在のモードを表示
opt.showmode = false
-- 打ったコマンドをステータスラインの下に表示
opt.showcmd = true
-- ステータスラインの右側にカーソルの現在位置を表示する
opt.ruler = true
-- タイトルバーにファイルパスを表示
opt.title = false
-- swap無効
opt.swapfile = false

opt.hlsearch = false

opt.background = 'dark'
opt.termguicolors = true

opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- ヘルプの言語の優先順位
opt.helplang = { 'ja', 'en' }

-- カーソルを中央にする
-- opt.scrolloff = 999

-- 背景透過
opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 10

-- サインカラムを常時表示
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

-- 保存するかの確認ダイアログを表示
opt.confirm = true

-- cursor style
-- opt.guicursor = {
--     i = 'block',
-- }
opt.mouse:remove({ 'n', 'i', 'c', 'r', 'v' })

opt.shada:remove({ '!', "'100", '<50', 's10', 'h' })
