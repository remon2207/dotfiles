vim.cmd[[
augroup color-config
    autocmd!
    autocmd ColorScheme * highlight Normal ctermbg=none
    autocmd ColorScheme * highlight LineNr ctermbg=none
    " autocmd VimEnter * ++nested colorscheme onedark
    autocmd VimEnter * ++nested colorscheme github_dark
    " autocmd VimEnter * ++nested colorscheme dracula
    " autocmd VimEnter * ++nested colorscheme tokyonight
augroup END
]]