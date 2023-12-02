-- 文字コード
vim.scriptencoding = 'utf-8'
-- リーダー
vim.g.mapleader = ' '

local options = {
  encoding = 'utf-8',
  fileencoding = 'utf-8',
  fileencodings = { 'utf-8', 'cp932', 'ucs-boms', 'euc-jp' },
  fileformats = { 'unix', 'dos', 'mac' },
  -- レジスタとクリップボードを共有
  clipboard = 'unnamedplus',
  -- インデント
  expandtab = true,
  autoindent = true,
  -- smartindent = true,
  smarttab = true,
  tabstop = 2,
  shiftwidth = 2,
  -- 大文字小文字を区別しない
  ignorecase = true,
  smartcase = true,
  -- 行数を表示
  number = true,
  -- 相対行にする
  relativenumber = true,
  -- カーソル行をハイライトする
  cursorline = true,
  -- Enable backspace key
  backspace = { 'indent', 'eol', 'start' },
  -- ステータスを表示
  laststatus = 2,
  cmdheight = 1,
  -- 現在のモードを非表示
  showmode = false,
  -- Sh command you hit
  showcmd = true,
  -- Sh current position on status line
  ruler = true,
  -- swapファイルを無効化
  swapfile = false,
  -- 検索結果をハイライトする
  hlsearch = true,
  background = 'dark',
  termguicolors = true,
  completeopt = { 'menu', 'menuone', 'noselect' },
  -- Priity of help language
  helplang = { 'ja', 'en' },
  -- Center the cursor line
  scrolloff = 5,
  sidescrolloff = 5,
  -- Pup window the background opacity
  wildoptions = 'pum',
  pumblend = 25,
  -- 常にサインカラムを表示
  signcolumn = 'yes',
  autoread = true,
  list = true,
  listchars = 'tab:> ,space: ',
  wrap = false,
  -- Cfirm dialog on close
  confirm = true,
  -- ターミナルモードのシェル
  shell = 'zsh',
  wildignore = '*/node_modules/*',
  mouse = ''
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
