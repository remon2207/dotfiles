if !exists('g:vscode')
  scriptencoding utf-8
  set encoding=utf-8

  augroup MyAutoCmd
    autocmd!
  augroup END

  if &compatible
    set nocompatible " Be iMproved
  endif

  runtime! ./config/*.vim
  runtime ./plugin.vim
  runtime! ./plugins/*.{vim,lua}
  runtime ./color.vim

else
  runtime! ./config/*.vim

  call plug#begin()
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-surround'
  call plug#end()
endif
