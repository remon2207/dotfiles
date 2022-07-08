local api = vim.api

api.nvim_create_augroup('color_config', {
    clear = true
})

api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    group = 'color_config',
    nested = true,
    -- command = 'colorscheme onedark',
    -- command = 'colorscheme onedark-nvim',
    -- command = 'colorscheme gruvbox',
    -- command = 'colorscheme gruvbox-material',
    -- command = 'colorscheme tokyonight',
    command = 'colorscheme solarized8',
})

api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    group = 'color_config',
    nested = true,
    command = 'highlight Normal ctermbg=NONE',
    command = 'highlight LineNr ctermbg=NONE',
})

-- vim-colarized8
api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    group = 'color_config',
    nested = true,
    command = 'highlight StatusLine guifg=#0c404f',
})
