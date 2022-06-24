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

  runtime config/global.vim

else
  runtime config/global.vim
  runtime config/plugin-manager.vim
  runtime config/option.vim
  runtime config/setting.vim
  runtime config/keymap.vim
  runtime config/autocmd.vim
  runtime config/color.vim
endif
