let mapleader = "\<Space>"

" 改行時の自動コメントアウトを無効化
autocmd FileType * setlocal formatoptions-=ro

if executable('fcitx5')
  autocmd InsertLeave * :call system('fcitx5-remote -c')
  autocmd CmdlineLeave * :call system('fcitx5-remote -c')
endif
