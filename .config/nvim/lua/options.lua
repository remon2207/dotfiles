vim.o.encoding = 'utf-8'
-- 保存時の文字コード
vim.o.fileencoding = 'utf-8'
-- 読み込み時の文字コードの自動判別. 左側が優先される
vim.o.fileencodings = 'ucs-boms,utf-8,euc-jp,cp932'
-- 改行コードの自動判別. 左側が優先される
vim.o.fileformats = 'unix,dos,mac'
-- □や○文字が崩れる問題を解決
vim.o.ambiwidth = 'single'
-- レジスタ、クリップボードの共有
vim.o.clipboard = 'unnamed,unnamedplus'
-- タブ入力を複数の空白入力に置き換える
vim.o.expandtab = true
-- 画面上でタブ文字が占める幅
vim.o.tabstop = 2
-- 改行時に前の行のインデントを継続する
vim.o.autoindent = true
-- 改行時に前の行の構文をチェックし次の行のインデントを増減する
vim.o.smartindent = true
-- smartindentで増減する幅
vim.o.shiftwidth = 2
-- インクリメンタルサーチ. １文字入力毎に検索を行う
vim.o.incsearch = true
-- 検索パターンに大文字小文字を区別しない
vim.o.ignorecase = true
-- 検索パターンに大文字を含んでいたら大文字小文字を区別する
vim.o.smartcase = true
-- 検索単語に大文字が含まれていた場合、特別な意味があると解釈しignorecaseを無効化
vim.o.smartcase = true
-- 一番下の単語まで行ったら一番上に戻る
-- vim.o.wrapscan = true
-- 行数表示
vim.o.number = true
-- カーソルラインをハイライト
vim.o.cursorline = true
-- バックスペースキーの有効化
vim.o.backspace = 'indent,eol,start'
-- 括弧の対応関係を一瞬表示する
vim.o.showmatch = true
-- コマンドモードの補完
vim.o.wildmenu = true
-- 保存するコマンド履歴の数
vim.o.history = 5000
-- ステータスラインを常に表示
vim.o.laststatus = 2
-- 現在のモードを表示
vim.o.showmode = false
-- 打ったコマンドをステータスラインの下に表示
vim.o.showcmd = true
-- ステータスラインの右側にカーソルの現在位置を表示する
vim.o.ruler = true
-- マウス操作を有効
vim.o.mouse = 'a'
