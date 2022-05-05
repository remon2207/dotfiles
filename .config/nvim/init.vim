scriptencoding utf-8
set encoding=utf-8

augroup MyAutoCmd
  autocmd!
augroup END

" プラグインの設定へジャンプ: 314行

if &compatible
  set nocompatible " Be iMproved
endif

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
    " Required:
    call dein#begin(s:dein_dir)
    " ヘルプの日本語化
    call dein#add('vim-jp/vimdoc-ja')
    " 選択範囲をGoogle翻訳
    call dein#add('skanehira/translate.vim')
    " markdown
    call dein#add('skanehira/preview-markdown.vim')
    " ステータスラインの表示内容強化
    call dein#add('vim-airline/vim-airline')
    " ステータスラインにbranch名
    call dein#add('tpope/vim-fugitive')
    " インデントの可視化
    call dein#add('Yggdroot/indentLine')
    " 末尾の全角半角空白文字を赤くハイライト
    call dein#add('bronson/vim-trailing-whitespace')
    " ノーマルモードでコメントアウト
    call dein#add('tpope/vim-commentary')
    " インデントの深さを可視化
    call dein#add('nathanaelkane/vim-indent-guides')
    " カラースキーム
    call dein#add('dracula/vim')
    " IDEのような補完
    call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })
    " ファイラー
    call dein#add('lambdalisue/fern.vim')
    call dein#add('lambdalisue/fern-git-status.vim')
    call dein#add('lambdalisue/fern-renderer-nerdfont.vim')
    call dein#add('lambdalisue/nerdfont.vim')
    call dein#add('yuki-yano/fern-preview.vim')
    call dein#add('lambdalisue/fern-hijack.vim')
    call dein#add('lambdalisue/fern-renderer-devicons.vim')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('lambdalisue/glyph-palette.vim')
    " 置換
    call dein#add('kana/vim-operator-replace')
    call dein#add('kana/vim-operator-user')
    " 高速移動
    call dein#add('easymotion/vim-easymotion')
    " tomlファイルのシンタックス
    call dein#add('cespare/vim-toml', { 'lazy': 'true', 'on_ft': ['toml'] })
    " JavaScriptのシンタックス
    call dein#add('pangloss/vim-javascript', { 'lazy': 'true', 'on_ft': ['javascript', 'javascript.jsx'] })
    " " JavaScriptのPrettier
    call dein#add('maxmellon/vim-jsx-pretty', { 'lazy': 'true', 'on_ft': ['javascript', 'javascript.jsx'] })
    call dein#add('yuezk/vim-js', { 'lazy': 'true', 'on_ft': ['javascript', 'javascript.jsx'] })
    " TypeScriptのシンタックス
    " call dein#add('leafgarland/typescript-vim', { 'lazy': 'true', 'on_ft': ['typescript', 'typescriptreact'] })
    call dein#add('HerringtonDarkholme/yats.vim', { 'lazy': 'true', 'on_ft': ['typescript', 'typescriptreact'] })
    " jsonのシンタックス
    call dein#add('elzr/vim-json', { 'lazy': 'true', 'on_ft' : ['json'] })
    " jsxのシンタックス
    call dein#add('peitalin/vim-jsx-typescript', { 'lazy': 'true', 'on_ft': ['javascript.jsx', 'typescriptreact']})
    " Dockerfileのシンタックス
    call dein#add('ekalinin/Dockerfile.vim')
    call dein#add('Townk/vim-autoclose')

    let s:rc_dir = expand('~/.config/nvim')
    if !isdirectory(s:rc_dir)
      call mkdir(s:rc_dir, 'p')
    endif

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

  augroup filetype
    autocmd!
    " ts
    autocmd FileType typescript inoremap <C-s> <Esc>:<C-u>Format<CR>:<C-u>w<CR>i
    " tsx
    autocmd FileType typescriptreact inoremap <C-s> <Esc>:<C-u>Format<CR>:<C-u>w<CR>i
    " js
    autocmd FileType javascript inoremap <C-s> <Esc>:<C-u>Format<CR>:<C-u>w<CR>i
    " jsx
    autocmd FileType javascriptreact inoremap <C-s> <Esc>:<C-u>Format<CR>:<C-u>w<CR>i
  augroup END

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


  " for Python
  let g:python3_host_prog = '/usr/bin/python3'

  augroup markdown
  autocmd!
  autocmd FileType markdown inoremap <C-s> <Esc>:<C-u>PreviewMarkdown right<CR><C-w>h
  augroup END

  let mapleader = "\<Space>"
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


" プラグインの設定
" vim-operator-replace
map _ <Plug>(operator-replace)

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END


" Coc.nvim
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" set background="dark"
autocmd Colorscheme * highlight Normal ctermbg=none
autocmd Colorscheme * highlight NonText ctermbg=none
autocmd Colorscheme * highlight Folded ctermbg=none
autocmd Colorscheme * highlight EndOfBuffer ctermbg=none
" " colorscheme 設定は source 後に行う必要があるので VimEnter で行う。
" " 但し Colorscheme イベントの発生が抑制されないよう nented を付ける。
au MyAutoCmd VimEnter * nested colorscheme dracula


" fern
" nnoremap <C-n> :Fern . -reveal=% -drawer -width=40<CR>
nnoremap <C-n> :<C-u>Fern . -reveal=%<CR>
let g:fern#default_hidden = 1
function! FernInit() abort
  nmap <buffer> v <Plug>(fern-action-open:side)
  nmap <buffer> M <Plug>(fern-action-new-dir)
  nmap <buffer> ! <Plug>(fern-action-hidden:toggle)
  nmap <buffer> - <Plug>(fern-action-mark:toggle)
  vmap <buffer> - <Plug>(fern-action-mark:toggle)
  nmap <buffer> C <Plug>(fern-action-clipboard-copy)
  nmap <buffer> X <Plug>(fern-action-clipboard-move)
  nmap <buffer> P <Plug>(fern-action-clipboard-paste)
  nmap <buffer> h <Plug>(fern-action-collapse)
  nmap <buffer> c <Plug>(fern-action-copy)
  nmap <buffer> <leader>h <Plug>(fern-action-leave)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> N <Plug>(fern-action-new-file)
  nmap <buffer> <cr> <Plug>(fern-action-open-or-enter)
  nmap <buffer> l <Plug>(fern-action-open-or-expand)
  nmap <buffer> s <Plug>(fern-action-open:select)
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  nmap <buffer> <C-l> <Plug>(fern-action-reload)
  nmap <buffer> r <Plug>(fern-action-rename)
  nmap <buffer> i <Plug>(fern-action-reveal)
  nmap <buffer> D <Plug>(fern-action-trash)
  nmap <buffer> y <Plug>(fern-action-yank)
  nmap <buffer> gr <Plug>(fern-action-grep)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> B <Plug>(fern-action-save-as-bookmark)
  nmap <buffer> cd <Plug>(fern-action-tcd)
endfunction
augroup FernEvents
  autocmd!
  autocmd FileType fern call FernInit()
augroup END
let g:fern#disable_default_mappings = 1


" fern-renderer-nerdfont
let g:fern#renderer = 'nerdfont'


" fern-preview
function! s:fern_settings() abort
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END


" fern-renderer-devicons
let g:fern#renderer = "devicons"


" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme='dracula'
