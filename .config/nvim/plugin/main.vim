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
  " Plug 'Shougo/ddc.vim'
  " Plug 'vim-denops/denops.vim'
  " Plug 'Shougo/ddc-around'
  " Plug 'Shougo/ddc-matcher_head'
  " Plug 'Shougo/ddc-sorter_rank'
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
