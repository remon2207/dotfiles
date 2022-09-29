set encoding=utf-8
" 保存時の文字コード
set fileencoding=utf-8
" 読み込み時の文字コードの自動判別. 左側が優先される
set fileencodings=utf-8,cp932,ucs-boms,euc-jp
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
set smarttab
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
" コマンドモードの補完
set wildmenu
" ステータスラインを常に表示
set laststatus=2
" 現在のモードを表示
set noshowmode
" 打ったコマンドをステータスラインの下に表示
set showcmd
" ステータスラインの右側にカーソルの現在位置を表示する
set ruler
" タイトルバーにファイルパスを表示
" set title
" swap無効
set noswapfile

set termguicolors
set background=dark

set completeopt=menu,menuone,noselect

" ヘルプの言語の優先順位
set helplang=ja,en

set scrolloff=999

" 改行時の自動コメントアウトを無効化
set formatoptions-=ro
