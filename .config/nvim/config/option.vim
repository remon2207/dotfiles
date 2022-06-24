filetype plugin indent on
syntax enable
" 保存時の文字コード
set fileencoding=utf-8
" 読み込み時の文字コードの自動判別. 左側が優先される
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
" 改行コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac
" レジスタ、クリップボードの共有
set clipboard+=unnamed,unnamedplus
" iTerm2など既に256色環境なら無くても良い
set t_Co=256
" タブ入力を複数の空白入力に置き換える
set expandtab
" 画面上でタブ文字が占める幅
set tabstop=4
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent
" smartindentで増減する幅
set shiftwidth=4
set softtabstop=4
" インクリメンタルサーチ. １文字入力毎に検索を行う
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" 一番下の単語まで行ったら一番上に戻る
set wrapscan
" 行数表示
set number
" カーソルラインをハイライト
set cursorline
" バックスペースキーの有効化
set backspace=indent,eol,start
" 括弧の対応関係を一瞬表示する
set showmatch
" コマンドモードの補完
set wildmenu
" 保存するコマンド履歴の数
set history=5000
" ステータスラインを常に表示
set laststatus=2
" 現在のモードを表示
set noshowmode
" 打ったコマンドをステータスラインの下に表示
set showcmd
" ステータスラインの右側にカーソルの現在位置を表示する
set ruler
" マウス操作を有効
" set mouse=a
" タイトルバーにファイルパスを表示
set title
" タブ・空白・改行等の表示
set list
" set listchars=tab:»-,eol:↲,extends:»,precedes:«,nbsp:%
set listchars=tab:»-,extends:»,precedes:«,nbsp:%
" swap無効
set noswapfile

set termguicolors
set background=dark

set ambiwidth=double
