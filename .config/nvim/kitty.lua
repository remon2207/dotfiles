local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local api = vim.api
local hl = api.nvim_set_hl
local autocmd = api.nvim_create_autocmd

-- グローバルオプション
local globals = {
  did_install_default_menus = 0,
  did_install_syntax_menu = 0,
  did_indent_on = 0,
  did_load_ftplugin = 0,
  loaded_node_provider = 0,
  loaded_perl_provider = 0,
  loaded_ruby_provider = 0,
  loaded_python3_provider = 0,
  loaded_2html_plugin = 0,
  loaded_getscript = 0,
  loaded_getscriptPlugin = 0,
  loaded_gzip = 0,
  loaded_logiPat = 0,
  loaded_logipat = 0,
  loaded_man = 0,
  loaded_matchit = 0,
  loaded_matchparen = 0,
  loaded_netrw = 0,
  loaded_netrwFileHandlers = 0,
  loaded_netrwPlugin = 0,
  loaded_netrwSettings = 0,
  loaded_remote_plugins = 0,
  loaded_rrhelper = 0,
  loaded_shada_plugin = 0,
  loaded_spellfile_plugin = 0,
  loaded_sql_completion = 0,
  loaded_tar = 0,
  loaded_tarPlugin = 0,
  loaded_tutor_mode_plugin = 0,
  loaded_vimball = 0,
  loaded_vimballPlugin = 0,
  loaded_zip = 0,
  loaded_zipPlugin = 0,
  skip_loading_mswin = 0,
  vimsyn_embed = 0
}

for k, v in pairs(globals) do
  vim.g[k] = v
end

-- オプション
-- 文字コード
vim.scriptencoding = 'utf-8'
-- リーダー
vim.g.mapleader = ' '

local options = {
  encoding = 'utf-8',
  fileencoding = 'utf-8',
  fileencodings = { 'utf-8', 'cp932', 'ucs-boms', 'euc-jp' },
  fileformats = { 'unix', 'dos', 'mac' },
  -- レジスタとクリップボードの共有
  clipboard = 'unnamedplus',
  -- インデント
  expandtab = true,
  autoindent = true,
  -- o.smartindent = true
  smarttab = true,
  tabstop = 2,
  shiftwidth = 2,
  -- 大文字小文字の区別をしない
  ignorecase = true,
  smartcase = true,
  -- 行数を表示
  number = false,
  -- カーソル行をハイライト
  -- o.cursorline = true,
  cursorline = false,
  backspace = { 'indent', 'eol', 'start' },
  -- ステータスラインとを表示
  laststatus = 1,
  cmdheight = 1,
  -- 現在のモードを非表示にする
  showmode = false,
  -- Show command you hit
  showcmd = true,
  -- Show current position on status line
  ruler = true,
  -- swapファイルを無効化
  swapfile = false,
  -- 検索結果をハイライトする
  hlsearch = true,
  background = 'dark',
  termguicolors = true,
  completeopt = { 'menu', 'menuone', 'noselect' },
  -- Priority of help language
  helplang = { 'ja', 'en' },
  -- Center the cursor line
  scrolloff = 5,
  sidescrolloff = 5,
  -- Popup window the background opacity
  wildoptions = 'pum',
  pumblend = 25,
  -- Show always sign column
  signcolumn = 'no',
  autoread = true,
  list = true,
  listchars = 'tab:> ,space: ',
  wrap = false,
  -- Confirm dialog on close
  confirm = true,
  mouse = '',
  -- ターミナルモードのシェル
  shell = 'zsh'
}

for k, v in pairs(options) do
  vim.opt[k] = v
end


-- キーバインド
keymap('n', '<Esc><Esc>', '<Cmd>set nohlsearch!<CR>', opts)
keymap('n', 'm', '<Nop>', opts)
keymap({ 'n', 'v' }, 'q', '<Nop>', opts)
keymap('n', '<C-z>', '<Nop>', opts)
keymap('n', 'i', '<Nop>', opts)
keymap('n', '<S-i>', '<Nop>', opts)
keymap('n', 'a', '<Nop>', opts)
keymap('n', '<S-a>', '<Nop>', opts)
keymap('n', 'q', '<Cmd>q<CR>', opts)

-- 自動コマンド
autocmd('TermOpen', {
  pattern = '*',
  command = 'normal G',
})

-- ハイライト
hl(0, 'Search', { bg = '#000000', bold = true })
hl(0, 'Visual', { fg = '#586e75', bg = '#002b36', reverse = true })
