set background="dark"
autocmd Colorscheme * highlight Normal ctermbg=none
autocmd Colorscheme * highlight NonText ctermbg=none
autocmd Colorscheme * highlight Folded ctermbg=none
autocmd Colorscheme * highlight EndOfBuffer ctermbg=none
" colorscheme 設定は source 後に行う必要があるので VimEnter で行う。
" 但し Colorscheme イベントの発生が抑制されないよう nented を付ける。
au MyAutoCmd VimEnter * nested colorscheme iceberg
