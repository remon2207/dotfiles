scriptencoding utf-8
set encoding=utf-8

augroup MyAutoCmd
  autocmd!
augroup END

if &compatible
  set nocompatible " Be iMproved
endif

filetype plugin indent on
syntax enable

" vscode-neovim
if !exists('g:vscode')
  " 改行時の自動コメントアウトを無効化
  au FileType * setlocal formatoptions-=ro

  if executable('fcitx5')
    autocmd InsertLeave * :call system('fcitx5-remote -c')
    autocmd CmdlineLeave * :call system('fcitx5-remote -c')
  endif

  runtime config/global.vim
endif

" file load ---------- {{{

runtime ./config/global.vim
runtime ./plugin.vim
runtime ./config/option.vim
runtime ./config/setting.vim
runtime ./config/autocmd.vim
runtime ./config/keymap.vim
runtime ./config/color.vim

" }}}