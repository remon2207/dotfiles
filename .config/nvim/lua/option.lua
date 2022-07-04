local opt = vim.opt

-- 保存時の文字コード
opt.fileencoding = 'utf-8'
-- 読み込み時の文字コードの自動判別. 左側が優先される
opt.fileencodings = 'ucs-boms,utf-8,euc-jp,cp932'
-- 改行コードの自動判別. 左側が優先される
opt.fileformats = 'unix,dos,mac'
-- レジスタ、クリップボードの共有
opt.clipboard = 'unnamed,unnamedplus'
-- タブ入力を複数の空白入力に置き換える
opt.expandtab = true
-- 画面上でタブ文字が占める幅
opt.tabstop = 4
-- 改行時に前の行のインデントを継続する
opt.autoindent = true
-- 改行時に前の行の構文をチェックし次の行のインデントを増減する
opt.smartindent = true
-- smartindentで増減する幅
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
opt.cursorcolumn = true
-- バックスペースキーの有効化
opt.backspace = 'indent,eol,start'
-- 括弧の対応関係を一瞬表示する
opt.showmatch = true
-- opt.matchtime = 1
-- コマンドモードの補完
opt.wildmenu = true
-- 保存するコマンド履歴の数
opt.history = 5000
-- ステータスラインを常に表示
opt.laststatus = 2
-- 現在のモードを表示
opt.showmode = false
-- 打ったコマンドをステータスラインの下に表示
opt.showcmd = true
-- ステータスラインの右側にカーソルの現在位置を表示する
opt.ruler = true
-- マウス操作を有効
-- vim.opt.mouse=a
-- タイトルバーにファイルパスを表示
opt.title = true
-- タブ・空白・改行等の表示
opt.list = true
-- vim.opt.listchars=tab:»-,eol:↲,extends:»,precedes:«,nbsp:%
opt.listchars = 'tab:»-,extends:»,precedes:«,nbsp:%'
-- swap無効
opt.swapfile = false

opt.termguicolors = true
opt.background = 'dark'

opt.completeopt = 'menu,menuone,noselect'

opt.signcolumn = 'yes'

opt.helplang = 'ja,en'