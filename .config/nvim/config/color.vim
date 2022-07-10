
augroup color_config
  autocmd!
  autocmd VimEnter * ++nested colorscheme onedark
  autocmd ColorScheme * ++nested highlight Normal ctermbg=NONE
  autocmd ColorScheme * ++nested highlight LineNr ctermbg=NONE
augroup END
