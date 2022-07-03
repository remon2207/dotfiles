if !exists('g:vscode')
  scriptencoding utf-8
  set encoding=utf-8

  augroup MyAutoCmd
    autocmd!
  augroup END

  if &compatible
    set nocompatible " Be iMproved
  endif

  " 改行時の自動コメントアウトを無効化
  autocmd FileType * setlocal formatoptions-=ro


  runtime! ./config/*.vim
  runtime ./plugin.vim
  runtime! ./plugins/*.{vim,lua}
  runtime ./color.vim

else
  runtime ./config/global.vim

  if executable('fcitx5')
    autocmd InsertLeave * :call system('fcitx5-remote -c')
    autocmd CmdlineLeave * :call system('fcitx5-remote -c')
  endif

  call plug#begin()
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-surround'
  call plug#end()
endif
