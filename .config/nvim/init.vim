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
  " □や○文字が崩れる問題を解決
  set ambiwidth=single
  " 改行時の自動コメントアウトを無効化
  au FileType * setlocal formatoptions-=r
  au FileType * setlocal formatoptions-=o

  if executable('fcitx5')
    autocmd InsertLeave * :call system('fcitx5-remote -c')
    autocmd CmdlineLeave * :call system('fcitx5-remote -c')
  endif

  " nmap s <Plug>(easymotion-s2)

  let g:fern_renderer_devicons_disable_warning = 1
else
  call plug#begin()
    " ヘルプの日本語化
    Plug 'vim-jp/vimdoc-ja'
    " 選択範囲をGoogle翻訳
    Plug 'skanehira/translate.vim'
    " markdown
    Plug 'godlygeek/tabular'
    Plug 'preservim/vim-markdown'
    " ステータスラインの表示内容強化
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
    Plug 'itchyny/lightline.vim'
    " ステータスラインにbranch名
    Plug 'tpope/vim-fugitive'
    " インデントの可視化
    Plug 'Yggdroot/indentLine'
    " 末尾の全角半角空白文字を赤くハイライト
    " Plug 'bronson/vim-trailing-whitespace'
    " ノーマルモードでコメントアウト
    Plug 'tpope/vim-commentary'
    " カラースキーム
    Plug 'dracula/vim'
    Plug 'cocopon/iceberg.vim'
    Plug 'joshdick/onedark.vim'
    Plug 'altercation/vim-colors-solarized'
    Plug 'arcticicestudio/nord-vim'
    Plug 'sickill/vim-monokai'
    Plug 'tomasr/molokai'
    Plug 'morhetz/gruvbox'
    Plug 'haishanh/night-owl.vim'
    Plug 'w0ng/vim-hybrid'
    Plug 'sainnhe/gruvbox-material'
    Plug 'folke/tokyonight.nvim'
    " IDEのような補完
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    " Plug 'prabirshrestha/vim-lsp'
    " Plug 'mattn/vim-lsp-settings'
    " 補完
    Plug 'Shougo/ddc.vim'
    Plug 'vim-denops/denops.vim'
    Plug 'Shougo/ddc-around'
    Plug 'Shougo/ddc-matcher_head'
    Plug 'Shougo/ddc-sorter_rank'
    " Plug 'prabirshrestha/asyncomplete.vim'
    " Plug 'prabirshrestha/asyncomplete-lsp.vim'
    " Plug 'shun/ddc-vim-lsp'
    " ファイラー
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/fern-git-status.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim'
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'yuki-yano/fern-preview.vim'
    Plug 'lambdalisue/fern-hijack.vim'
    Plug 'lambdalisue/fern-renderer-devicons.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'lambdalisue/glyph-palette.vim'
    " 置換
    Plug 'kana/vim-operator-replace'
    Plug 'kana/vim-operator-user'
    " 高速移動
    Plug 'easymotion/vim-easymotion'
    " tomlファイルのシンタックス
    Plug 'cespare/vim-toml'
    " JavaScriptのシンタックス
    Plug 'pangloss/vim-javascript'
    Plug 'othree/yajs.vim'
    Plug 'othree/es.next.syntax.vim'
    " " JavaScriptのPrettier
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript',  'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
    Plug 'yuezk/vim-js'
    " TypeScriptのシンタックス
    " Plug 'leafgarland/typescript-vim'
    Plug 'HerringtonDarkholme/yats.vim'
    " jsonのシンタックス
    Plug 'elzr/vim-json'
    " jsxのシンタックス
    Plug 'peitalin/vim-jsx-typescript'
    " Dockerfileのシンタックス
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'Townk/vim-autoclose'
    " HTML/CSSの入力補助
    Plug 'mattn/emmet-vim'
    Plug 'hail2u/vim-css3-syntax'
    " ブラケットの自動補完
    Plug 'jiangmiao/auto-pairs'
    " 引用符
    Plug 'tpope/vim-surround'
    " ファイル検索
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    " 色を視覚的に表示する
    Plug 'chrisbra/Colorizer'
    " html ライブ編集
    Plug 'turbio/bracey.vim'
    " csv
    Plug 'mechatroner/rainbow_csv'
    Plug 'voldikss/vim-floaterm'
    " PHP
    Plug 'stephpy/vim-php-cs-fixer'
    "syntax highlight
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " スニペット
    Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'
  call plug#end()

  " option ---------------------------------------------------------------

  " filetype plugin indent on
  " syntax enable

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
  set autoread
  " 改行時の自動コメントアウトを無効化
  autocmd FileType * set formatoptions-=r
  autocmd FileType * set formatoptions-=o
  " □や○文字が崩れる問題を解決
  " set ambiwidth=double

  " プロバイダを無効化
  let g:loaded_node_provider = 0
  let g:loaded_perl_provider = 0
  let g:loaded_ruby_provider = 0


  " keymap ---------------------------------------------------------------
  nnoremap <Left> <Nop>
  nnoremap <Down> <Nop>
  nnoremap <Up> <Nop>
  nnoremap <Right> <Nop>
  " nnoremap <Down> gj
  " nnoremap <Up> gk

  " ESCキー2度押しでハイライトの切り替え
  nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
  " インサートモードでファイル更新
  inoremap <silent> <C-s> <Esc>:<C-u>update<CR>
  " 行が折り返しされていたら表示行単位で移動
  nnoremap j gj
  nnoremap k gk

  if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    nnoremap <silent> <C-t> :<C-u>terminal<CR>
    nnoremap <silent> ss :<C-u>sp<CR><C-w>w
    nnoremap <silent> sv :<C-u>vs<CR><C-w>w
  endif

  augroup fileRead
    autocmd!
    autocmd BufEnter *.css,*.scss,*.js,*.jsx,*.ts,*.tsx execute 'ColorHighlight'
    " autocmd BufNewFile,BufRead, *.ts setfiletype typescript
    autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
    autocmd BufNewFile,BufRead Dockerfile set ft=dockerfile
    " autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
  augroup END

  " augroup color-highlight
  "   autocmd!
  "   autocmd CursorHold * silent call CocActionAsync('highlight')
  " augroup END

  augroup php
    autocmd!
    autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
  augroup END

  augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx,*.json,*.yml,*.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
    " autocmd VimEnter *.js,*.jsx,*.ts,*.tsx,*.json,*.yml,*.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
  augroup END

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
  nnoremap <silent> fh :<C-u>bprev<CR>
  nnoremap <silent> fl :<C-u>bnext<CR>

  " cursor
  inoremap <C-d> <Del>


  " for Python
  let g:python3_host_prog = '/usr/bin/python3'


  if executable('fcitx5')
    autocmd InsertLeave * :call system('fcitx5-remote -c')
  endif

" --------------------------------------------------------------------------
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

  let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-prettier',
      \ 'coc-eslint',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-phpls',
      \ ]

  if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

  set termguicolors
  set background=dark
  " " colorscheme 設定は source 後に行う必要があるので VimEnter で行う。
  " " 但し Colorscheme イベントの発生が抑制されないよう nented を付ける。
  " autocmd MyAutoCmd VimEnter * nested colorscheme dracula
  " autocmd MyAutoCmd VimEnter * nested colorscheme iceberg
  " autocmd MyAutoCmd VimEnter * nested colorscheme night-owl
  " autocmd MyAutoCmd VimEnter * nested colorscheme hybrid
  " autocmd MyAutoCmd VimEnter * nested colorscheme monokai
  " autocmd MyAutoCmd VimEnter * nested colorscheme molokai
  " autocmd MyAutoCmd VimEnter * nested colorscheme tokyonight
  " autocmd MyAutoCmd VimEnter * nested colorscheme nord
  autocmd MyAutoCmd VimEnter * nested colorscheme onedark
  " autocmd MyAutoCmd VimEnter * nested colorscheme gruvbox
  " autocmd MyAutoCmd VimEnter * nested colorscheme solarized
  " autocmd MyAutoCmd VimEnter * nested colorscheme gruvbox-material


  "molokai
  let g:molokai_original = 0

  " tokyonight
  let tokyonight_italic_comments = 0
  let tokyonight_italic_keywords = 0

  " dracula
  let g:dracula_italic = 0

  " onedark
  let g:onedark_termcolors=256
  " let g:onedark_termcolors=16

  " fern
  " nnoremap <C-n> :Fern . -reveal=% -drawer -width=40<CR>
  nnoremap <silent> <C-n> :<C-u>Fern . -reveal=%<CR>
  let g:fern#default_hidden = 1
  function! FernInit() abort
  "   nmap <buffer> v <Plug>(fern-action-open:side)
  "   nmap <buffer> M <Plug>(fern-action-new-dir)
  "   nmap <buffer> ! <Plug>(fern-action-hidden:toggle)
  "   nmap <buffer> - <Plug>(fern-action-mark:toggle)
  "   vmap <buffer> - <Plug>(fern-action-mark:toggle)
  "   nmap <buffer> C <Plug>(fern-action-clipboard-copy)
  "   nmap <buffer> X <Plug>(fern-action-clipboard-move)
  "   nmap <buffer> P <Plug>(fern-action-clipboard-paste)
  "   nmap <buffer> h <Plug>(fern-action-collapse)
  "   nmap <buffer> c <Plug>(fern-action-copy)
  "   nmap <buffer> <leader>h <Plug>(fern-action-leave)
  "   nmap <buffer> m <Plug>(fern-action-move)
  "   nmap <buffer> N <Plug>(fern-action-new-file)
  "   nmap <buffer> <cr> <Plug>(fern-action-open-or-enter)
  "   nmap <buffer> l <Plug>(fern-action-open-or-expand)
  "   nmap <buffer> s <Plug>(fern-action-open:select)
  "   nmap <buffer> t <Plug>(fern-action-open:tabedit)
  "   nmap <buffer> <C-l> <Plug>(fern-action-reload)
  "   nmap <buffer> r <Plug>(fern-action-rename)
  "   nmap <buffer> i <Plug>(fern-action-reveal)
  "   nmap <buffer> D <Plug>(fern-action-trash)
  "   nmap <buffer> y <Plug>(fern-action-yank)
  "   nmap <buffer> gr <Plug>(fern-action-grep)
    nmap <buffer> d <Plug>(fern-action-remove)
  "   nmap <buffer> B <Plug>(fern-action-save-as-bookmark)
  "   nmap <buffer> cd <Plug>(fern-action-tcd)
  endfunction
  augroup FernEvents
    autocmd!
    autocmd FileType fern call FernInit()
  augroup END
  " let g:fern#disable_default_mappings = 1


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
  let g:fern_renderer_devicons_disable_warning = 1


  " vim-airline
  " let g:airline#extensions#tabline#enabled = 1
  " let g:airline#extensions#tabline#left_sep = ' '
  " let g:airline#extensions#tabline#left_alt_sep = '|'
  " let g:airline#extensions#tabline#formatter = 'default'
  " let g:airline_powerline_fonts = 1
  " let g:airline#extensions#branch#enabled = 1
  " let g:airline_solarized_bg='dark'
  " let g:airline_theme='night-owl'
  " let g:airline_theme='dracula'
  " let g:airline_theme='iceberg'
  " let g:airline_theme='nord'
  " let g:airline_theme='solarized'
  " let g:airline_theme='onedark'
  " let g:airline_theme='monokai'


  " lightline
  let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }


  " emmet-vim
  let g:user_emmet_settings = {
  \  'variables': {'lang': 'ja'},
  \  'html': {
  \    'default_attributes': {
  \      'option': {'value': v:null},
  \      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
  \    },
  \    'snippets': {
  \      'html:5': "<!DOCTYPE html>\n"
  \              ."<html lang=\"${lang}\">\n"
  \              ."\t<head>\n"
  \              ."\t\t<meta charset=\"${charset}\" />\n"
  \              ."\t\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n"
  \              ."\t\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n"
  \              ."\t\t<title></title>\n"
  \              ."\t</head>\n"
  \              ."\t<body>\n\t\t${child}|\n\t</body>\n"
  \              ."</html>",
  \      '!': "\t\t<meta charSet=\"${charset}\" />\n"
  \              ."\t\t<meta httpEquiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n"
  \              ."\t\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n"
  \              ."\t\t<title>{title}</title>\n",
  \    },
  \  },
  \}


  " fzf.vim
  let g:fzf_command_prefix = 'Fzf'
  nnoremap <silent> <S-f> :<C-u>FzfFiles<CR>
  nnoremap <silent> f<S-f> :<C-u>FzfBuffers<CR>


  " vim-floaterm
  let g:floaterm_keymap_new = '<Leader>ft'


  " If php-cs-fixer is in $PATH, you don't need to define line below
  let g:php_cs_fixer_path = "~/.config/nvim/php-cs-fixer-v3.phar" "define the path to the php-cs-fixer.phar

  " If you use php-cs-fixer version 1.x
  let g:php_cs_fixer_level = "symfony"                   " options: --level (default:symfony)
  let g:php_cs_fixer_config = "default"                  " options: --config
  " If you want to define specific fixers:
  "let g:php_cs_fixer_fixers_list = "linefeed,short_tag" " options: --fixers
  "let g:php_cs_fixer_config_file = '.php_cs'            " options: --config-file
  " End of php-cs-fixer version 1 config params

  " If you use php-cs-fixer version 2.x
  let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
  "let g:php_cs_fixer_cache = ".php_cs.cache" " options: --cache-file
  "let g:php_cs_fixer_config_file = '.php_cs' " options: --config
  " End of php-cs-fixer version 2 config params

  let g:php_cs_fixer_php_path = "/usr/bin/php"               " Path to PHP
  let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
  let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
  let g:php_cs_fixer_verbose = 0


  " ddc.vim
  " Customize global settings
  " Use around source.
  " https://github.com/Shougo/ddc-around
  call ddc#custom#patch_global('sources', ['around'])

  " Use matcher_head and sorter_rank.
  " https://github.com/Shougo/ddc-matcher_head
  " https://github.com/Shougo/ddc-sorter_rank
  call ddc#custom#patch_global('sourceOptions', {
        \ '_': {
        \   'matchers': ['matcher_head'],
        \   'sorters': ['sorter_rank']},
        \ })

  " Change source options
  call ddc#custom#patch_global('sourceOptions', {
        \ 'around': {'mark': 'A'},
        \ })
  call ddc#custom#patch_global('sourceParams', {
        \ 'around': {'maxSize': 500},
        \ })

  " Customize settings on a filetype
  call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['around', 'clangd'])
  call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
        \ 'clangd': {'mark': 'C'},
        \ })
  call ddc#custom#patch_filetype('markdown', 'sourceParams', {
        \ 'around': {'maxSize': 100},
        \ })

  " Mappings

  " <TAB>: completion.
  inoremap <silent><expr> <TAB>
  \ ddc#map#pum_visible() ? '<C-n>' :
  \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
  \ '<TAB>' : ddc#map#manual_complete()

  " <S-TAB>: completion back.
  inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'

  " Use ddc.
  " call ddc#enable()

  " if executable('intelephense')
  "   " pip install python-language-server
  "   au User lsp_setup call lsp#register_server({
  "       \ 'name': 'intelephense',
  "       \ 'cmd': {server_info->['php']},
  "       \ 'allowlist': ['php'],
  "       \ })
" endif


  " function! s:on_lsp_buffer_enabled() abort
  "   setlocal omnifunc=lsp#complete
  "   setlocal signcolumn=yes
  "   if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  "   nmap <buffer> gd <plug>(lsp-definition)
  "   nmap <buffer> gs <plug>(lsp-document-symbol-search)
  "   nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  "   nmap <buffer> gr <plug>(lsp-references)
  "   nmap <buffer> gi <plug>(lsp-implementation)
  "   nmap <buffer> gt <plug>(lsp-type-definition)
  "   nmap <buffer> <leader>rn <plug>(lsp-rename)
  "   nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  "   nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  "   nmap <buffer> K <plug>(lsp-hover)
  "   " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
  "   " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

  "   let g:lsp_format_sync_timeout = 1000
  "   autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

  "   " refer to doc to add more commands
  " endfunction

  " augroup lsp_install
  "   au!
  "   " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  "   autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
  " augroup END


  " " vim-prettier
  " let g:prettier#exec_cmd_async = 1
  " let g:prettier#quickfix_enabled = 0

  " " Max line length that prettier will wrap on: a number or 'auto' (use
  " " textwidth).
  " " default: 'auto'
  " let g:prettier#config#print_width = 120
  
  " " number of spaces per indentation level: a number or 'auto' (use
  " " softtabstop)
  " " default: 'auto'
  " let g:prettier#config#tab_width = 2
  
  " " use tabs instead of spaces: true, false, or auto (use the expandtab setting).
  " " default: 'auto'
  " let g:prettier#config#use_tabs = 'false'
  
  " " flow|babylon|typescript|css|less|scss|json|graphql|markdown or empty string
  " " (let prettier choose).
  " " default: ''
  " let g:prettier#config#parser = ''
  
  " " cli-override|file-override|prefer-file
  " " default: 'file-override'
  " let g:prettier#config#config_precedence = 'file-override'
  
  " " always|never|preserve
  " " default: 'preserve'
  " let g:prettier#config#prose_wrap = 'preserve'
  
  " " css|strict|ignore
  " " default: 'css'
  " let g:prettier#config#html_whitespace_sensitivity = 'css'
  
  " " false|true
  " " default: 'false'
  " let g:prettier#config#require_pragma = 'false'
  
  " " Define the flavor of line endings
  " " lf|crlf|cr|all
  " " defaut: 'lf'
  " let g:prettier#config#end_of_line = get(g:, 'prettier#config#end_of_line', 'lf')


  
let g:UltiSnipsJumpForwardTrigger='<c-f>'
let g:UltiSnipsJumpBackwardTrigger='<c-b>'


" nvim-treesitter
lua <<EOF
require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true
    },
    ensure_installed = {
        "javascript",
        "bash",
        "css",
        "scss",
        "dockerfile",
        "lua",
        "html",
        "json",
        "jsonc",
        "markdown",
        "php",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml"
    }
}
EOF

endif

" neovim and vscode settings
let mapleader = "\<Space>"
