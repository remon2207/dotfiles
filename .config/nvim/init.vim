" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END


" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.config/nvim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.config/nvim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'
  let s:lazy_toml = s:rc_dir . '/dein_lazy.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

filetype plugin indent on
syntax enable

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}

" ファイル読み込み
lua require('options')
lua require('keys')
runtime! keys.rc.vim


" set t_Co=256 " iTerm2など既に256色環境なら無くても良い

""----------------------------------------------------------
"" 文字
""----------------------------------------------------------
"set fileencoding=utf-8 " 保存時の文字コード
"set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
"set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
""set ambiwidth=double " □や○文字が崩れる問題を解決
"set ambiwidth=single " □や○文字が崩れる問題を解決

""----------------------------------------------------------
"" レジスタ、クリップボード
""----------------------------------------------------------
"set clipboard+=unnamedplus

""----------------------------------------------------------
"" タブ・インデント
""----------------------------------------------------------
"set expandtab " タブ入力を複数の空白入力に置き換える
"set tabstop=2 " 画面上でタブ文字が占める幅
""set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
"set autoindent " 改行時に前の行のインデントを継続する
"set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
"set shiftwidth=2 " smartindentで増減する幅

""----------------------------------------------------------
"" 文字列検索
""----------------------------------------------------------
"set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
"set ignorecase " 検索パターンに大文字小文字を区別しない
"set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
"" set hlsearch " 検索結果をハイライト

"" 大文字小文字を区別しない
"set ignorecase
"" 検索単語に大文字が含まれていた場合、特別な意味があると解釈しignorecaseを無効化
"set smartcase
"" 一番下の単語まで行ったら一番上に戻る
"set wrapscan

""---------------------------------------------------------- カーソル
""----------------------------------------------------------
"" set number " 行番号を表示
"set cursorline " カーソルラインをハイライト

"" バックスペースキーの有効化
"set backspace=indent,eol,start

""----------------------------------------------------------
"" カッコ・タグの対応
""----------------------------------------------------------
"set showmatch " 括弧の対応関係を一瞬表示する
"source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

""----------------------------------------------------------
"" コマンドモード
""----------------------------------------------------------
"set wildmenu " コマンドモードの補完
"set history=5000 " 保存するコマンド履歴の数

""----------------------------------------------------------
"" ステータスライン
""----------------------------------------------------------
"set laststatus=2 " ステータスラインを常に表示
"" set showmode " 現在のモードを表示
"set showcmd " 打ったコマンドをステータスラインの下に表示
"set ruler " ステータスラインの右側にカーソルの現在位置を表示する

""----------------------------------------------------------
"" マウスでカーソル移動とスクロール
""----------------------------------------------------------
""if has('mouse')
""    set mouse=a
""    if has('mouse_sgr')
""        set ttymouse=sgr
""    elseif v:version > 703 || v:version is 703 && has('patch632')
""        set ttymouse=sgr
""    else
""        set ttymouse=xterm2
""    endif
""endif
"set mouse=a

"----------------------------------------------------------
" クリップボードからのペースト
"----------------------------------------------------------
" 挿入モードでクリップボードからペーストする時に自動でインデントさせないようにする
" if &term =~ "xterm"
"     let &t_SI .= "\e[?2004h"
"     let &t_EI .= "\e[?2004l"
"     let &pastetoggle = "\e[201~"

"     function XTermPasteBegin(ret)
"         set paste
"         return a:ret
"     endfunction

"     inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
" endif




"----------------------------------------------------------
" terminalモード
"----------------------------------------------------------
" if has('nvim')
"   " 新しいタブでターミナルを起動
"   nnoremap @t :tabe<CR>:terminal<CR>
"   " Ctrl + q でターミナルを終了
" tnoremap <C-q> <C-\><C-n>:q<CR>
"   " ESCでターミナルモードからノーマルモードへ
"   tnoremap <ESC> <C-\><C-n>
"   " 分割
"   command! -nargs=* Tsp split | terminal <args>
"   command! -nargs=* Tvs vsplit | terminal <args>
" endif




" set noshowmode



let g:python3_host_prog = '/usr/bin/python3'
