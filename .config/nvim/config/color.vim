" colorscheme tokyonight
" colorscheme solarized
" colorscheme onedark
" colorscheme iceberg
" colorscheme hybrid
" colorscheme gruvbox
" colorscheme dracula
" colorscheme molokai
" colorscheme nord
" colorscheme gruvbox-material
" colorscheme palenight
" colorscheme palenight
" colorscheme solarized8

augroup colors
    autocmd!
    autocmd ColorScheme * highlight Normal ctermbg=none
    autocmd ColorScheme * highlight LineNr ctermbg=none
    " autocmd VimEnter * ++nested colorscheme tokyonight
    " autocmd VimEnter * ++nested colorscheme solarized8
    " autocmd VimEnter * ++nested colorscheme solarized8
    autocmd VimEnter * ++nested colorscheme github_dark
    " colorscheme solarized
augroup END
