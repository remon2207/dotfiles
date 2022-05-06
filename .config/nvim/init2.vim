scriptencoding utf-8
set encoding=utf-8

augroup MyAutoCmd
  autocmd!
augroup END

" vim or vscode
if exists('g:vscode')
  call plug#begin('~/.config/nvim/plugged')
  Plug 'tpope/vim-commentary'
  Plug 'asvetliakov/vim-easymotion'
  call plug#end()

  " □や○文字が崩れる問題を解決
  set ambiwidth=single

  if executable('fcitx5')
    autocmd InsertLeave * :call system('fcitx5-remote -c')
    autocmd CmdlineLeave * :call system('fcitx5-remote -c')
  endif

 nmap s <Plug>(easymotion-s2)
else
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

  " option ---------------------------------------------------------------
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
  set tabstop=2
  " 改行時に前の行のインデントを継続する
  set autoindent
  " 改行時に前の行の構文をチェックし次の行のインデントを増減する
  set smartindent
  " smartindentで増減する幅
  set shiftwidth=2
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
  set mouse=a
  " タイトルバーにファイルパスを表示
  set title

  " タブ・空白・改行等の表示
  set list
  " set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
  set listchars=tab:»-,eol:↲,extends:»,precedes:«,nbsp:%

  " swap無効
  set noswapfile

  " モード切り替えを速くする
  " set timeout timeoutlen=1000 ttimeoutlen=50

  " 改行時の自動コメントアウトを無効化
  au FileType * setlocal formatoptions-=r
  au FileType * setlocal formatoptions-=o
  " □や○文字が崩れる問題を解決
  " set ambiwidth=double
  nnoremap <Left> <Nop>
  nnoremap <Down> <Nop>
  nnoremap <Up> <Nop>
  nnoremap <Right> <Nop>
  " nnoremap <Down> gj
  " nnoremap <Up> gk

  " keymap ---------------------------------------------------------------
  " ESCキー2度押しでハイライトの切り替え
  nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
  " 行頭へ移動
  " inoremap <C-a> <Home>
  " " 行末へ移動
  " inoremap <C-e> <End>
  " " Exコマンドを実装する関数を定義
  " function! ExecExCommand(cmd)
  "   silent exec a:cmd
  "   return ''
  " endfunction
  " inoremap <silent> <expr> <C-b> "<C-r>=ExecExCommand('normal k')<CR>"
  " inoremap <silent> <expr> <C-f> "<C-r>=ExecExCommand('normal j')<CR>"
  " " 補完せず補完ウィンドウを閉じてから移動
  " inoremap <silent> <expr> <C-b> pumvisible() ? "<C-e><C-r>=ExecExCommand('normal b')<CR>" : "<C-r>=ExecExCommand('normal b')<CR>"
  " inoremap <silent> <expr> <C-f> pumvisible() ? "<C-e><C-r>=ExecExCommand('normal w')<CR>" : "<C-r>=ExecExCommand('normal w')<CR>"
  " インサートモードでファイル更新
  inoremap <silent> <C-s> <Esc>:<C-u>update<CR>
  " 行が折り返しされていたら表示行単位で移動
  nnoremap j gj
  nnoremap k gk

  if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    nnoremap <C-t> :<C-u>terminal<CR>
    nnoremap <silent> ss :<C-u>sp<CR><C-w>w
    nnoremap <silent> sv :<C-u>vs<CR><C-w>w
  endif

  " augroup filetype
  "   autocmd!
  "   " ts
  "   autocmd FileType typescript inoremap <C-s> <Esc>:<C-u>Format<CR>:<C-u>w<CR>i
  "   " tsx
  "   autocmd FileType typescriptreact inoremap <C-s> <Esc>:<C-u>Format<CR>:<C-u>w<CR>i
  "   " js
  "   autocmd FileType javascript inoremap <C-s> <Esc>:<C-u>Format<CR>:<C-u>w<CR>i
  "   " jsx
  "   autocmd FileType javascriptreact inoremap <C-s> <Esc>:<C-u>Format<CR>:<C-u>w<CR>i
  " augroup END

  " <Ctrl+q>で終了
  nnoremap <silent> <C-q> :<C-u>q<CR>
  nnoremap <silent> <C-S-q> :<C-u>q!<CR>

  " window
  nnoremap sh <C-w>h
  nnoremap sH <C-w>H
  nnoremap sj <C-w>j
  nnoremap sJ <C-w>J
  nnoremap sk <C-w>k
  nnoremap sK <C-w>K
  nnoremap sl <C-w>l
  nnoremap sL <C-w>L

  " tab
  nnoremap <silent> tn :<C-u>tabnew<CR>
  nnoremap tl gt
  nnoremap th gT

  " buffer
  nnoremap <silent> fj :<C-u>bprev<CR>
  nnoremap <silent> fk :<C-u>bnext<CR>

  " cursor
  inoremap <C-d> <Del>
  " inoremap <A-h> <Left>
  " inoremap <A-j> <Down>
  " inoremap <A-k> <Up>
  " inoremap <A-l> <Right>


  " for Python
  let g:python3_host_prog = '/usr/bin/python3'

  augroup markdown
  autocmd!
  autocmd FileType markdown inoremap <C-s> <Esc>:<C-u>PreviewMarkdown right<CR><C-w>h
  augroup END
endif






" inoremap <silent> <Esc> <Esc>:<C-u>call system('fcitx-remote -o')<CR>
" augroup IME
"   if has('unix')
"     autocmd!
"     autocmd InsertLeave * call system('fcitx-remote -o')
"     autocmd InsertEnter * call system('fcitx-remote -c')
"   endif
" augroup END

if executable('fcitx5')
   autocmd InsertLeave * :call system('fcitx5-remote -c')
   " autocmd CmdlineLeave * :call system('fcitx5-remote -c')
endif
" augroup IME
"   if has('unix')
"     autocmd!
"     autocmd <C-@> call system('fcitx-remote -o')
"   endif
" augroup END


" vim-operator-replace
map _ <Plug>(operator-replace)
" augroup my-glyph-palette
"   autocmd! *
"   autocmd FileType fern call glyph_palette#apply()
"   autocmd FileType nerdtree,startify call glyph_palette#apply()
" augroup END