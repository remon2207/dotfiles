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
  runtime configs/global.vim

  let g:fern_renderer_devicons_disable_warning = 1
else
  runtime configs/global.vim
  runtime configs/plugin-manager.vim
  runtime configs/option.vim
  runtime configs/setting.vim
  runtime configs/keymap.vim
  runtime configs/autocmd.vim
  runtime colors/main.vim
endif
