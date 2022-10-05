local opt = vim.opt

-- 保存時の文字コード
opt.fileencoding = "utf-8"
-- 読み込み時の文字コードの自動判別. 左側が優先される
opt.fileencodings = "utf-8,cp932,ucs-boms,euc-jp,"
-- 改行コードの自動判別. 左側が優先される
opt.fileformats = "unix,dos,mac"
-- レジスタ、クリップボードの共有
opt.clipboard = "unnamed,unnamedplus"
-- タブ入力を複数の空白入力に置き換える
opt.expandtab = true
-- 画面上でタブ文字が占める幅 opt.tabstop = 4
-- 改行時に前の行のインデントを継続する
opt.autoindent = true
opt.smartindent = true
-- opt.cindent = true
-- 改行時に前の行の構文をチェックし次の行のインデントを増減する
opt.smarttab = true
-- smartindentで増減する幅
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
-- インクリメンタルサーチ. １文字入力毎に検索を行う
opt.incsearch = true
-- 検索パターンに大文字小文字を区別しない
opt.ignorecase = true
-- 検索パターンに大文字を含んでいたら大文字小文字を区別する
opt.smartcase = true
-- 一番下の単語まで行ったら一番上に戻る
opt.wrapscan = true
-- 行数表示
opt.number = true
-- カーソルラインをハイライト
opt.cursorline = true
-- opt.cursorcolumn = true
-- バックスペースキーの有効化
opt.backspace = "indent,eol,start"
-- コマンドモードの補完
opt.wildmenu = true
-- ステータスラインを常に表示
opt.laststatus = 2
-- 現在のモードを表示
opt.showmode = false
-- 打ったコマンドをステータスラインの下に表示
opt.showcmd = true
-- ステータスラインの右側にカーソルの現在位置を表示する
opt.ruler = true
-- タイトルバーにファイルパスを表示
opt.title = true
-- swap無効
opt.swapfile = false

opt.background = "dark"
opt.termguicolors = true

opt.completeopt = "menu,menuone,noselect"

-- ヘルプの言語の優先順位
opt.helplang = "ja,en"

opt.scrolloff = 999

-- 背景透過
opt.winblend = 0
-- opt.wildmenu = true
opt.wildoptions = "pum"
opt.pumblend = 5

-- 行数を相対行にする
--opt.relativenumber = true
