scriptencoding utf-8
set encoding=utf-8
augroup MyAutoCmd
  autocmd!
augroup END

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

  let g:fern_renderer_devicons_disable_warning = 1
else
  runtime plugin/main.vim
  runtime config/option.vim
  runtime config/setting.vim
  runtime config/keymap.vim
  runtime config/autocmd.vim

" -------------------------
  " プラグインの設定
  runtime plugin/coc.vim
  runtime plugin/vim-php-cs-fixer.vim
  runtime plugin/vim-operator-replace.vim
  runtime plugin/glyph-palette.vim
  runtime colors/main.vim
  runtime plugin/molokai.vim
  runtime plugin/tokyonight.vim
  runtime plugin/dracula.vim
  runtime plugin/onedark.vim
  runtime plugin/fern.vim
  runtime plugin/vim-airline.vim
  runtime plugin/lightline.vim
  runtime plugin/emmet-vim.vim
  runtime plugin/fzf.vim
  runtime plugin/vim-floaterm.vim
  runtime plugin/ddc.vim
  runtime plugin/vim-lsp.vim
  runtime plugin/vim-prettier.vim
  runtime plugin/ultisnips.vim
  runtime plugin/nvim-treesitter.vim

endif

" neovim and vscode settings
runtime config/global.vim
