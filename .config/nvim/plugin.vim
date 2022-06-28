call plug#begin()
" ---------- 起動時 ----------

" ブラケットの自動補完
Plug 'jiangmiao/auto-pairs'

" ステータスラインの強化
" Plug 'tpope/vim-fugitive'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" インデントの可視化
Plug 'Yggdroot/indentLine'

" カラースキーム
Plug 'folke/tokyonight.nvim'

" シンタックス
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" ヘルプを日本語化
Plug 'vim-jp/vimdoc-ja'

" ノーマルモードでコメントアウト
Plug 'tpope/vim-commentary'

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

" フローティングウィンドウ
Plug 'voldikss/vim-floaterm'

" ファイル検索
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" 引用符
Plug 'tpope/vim-surround'

" 置換
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'

" ジャンプ
Plug 'easymotion/vim-easymotion'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" 補完
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" 補完ウィンドウUI
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

" ---------- 遅延読み込み ----------
" jsonのシンタックス
Plug 'elzr/vim-json', { 'for': 'json' }
" スニペット
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascriptreact', 'typescriptreact'] }
Plug 'SirVer/ultisnips', { 'for': ['typescript', 'typescriptreact'] }
" CSV
Plug 'mechatroner/rainbow_csv', { 'for': 'csv' }
" PHP
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }

Plug 'windwp/nvim-ts-autotag', { 'for': ['javascriptreact', 'typescriptreact'] }

" 色を視覚的に表示
Plug 'chrisbra/Colorizer', { 'for': ['html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'] }

" フォーマッター
Plug 'prettier/vim-prettier', { 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" ウィンドウリサイズ
Plug 'simeji/winresizer', { 'on': 'WinResizerStartResize' }

" 選択範囲をGoogle翻訳
Plug 'skanehira/translate.vim', { 'on': 'Translate' }

call plug#end()