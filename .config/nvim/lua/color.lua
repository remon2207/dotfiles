local api = vim.api


api.nvim_create_augroup('color_config', {
    clear = true
})


api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    group = 'color_config',
    nested = true,
    command = 'highlight Normal ctermbg=NONE guibg=NONE',
    command = 'highlight NonText ctermbg=NONE guibg=NONE',
    command = 'highlight LineNr ctermbg=NONE guibg=NONE',
    command = 'highlight Folded ctermbg=NONE guibg=NONE',
    command = 'highlight EndOfBuffer ctermbg=NONE guibg=NONE',
    -- command = 'colorscheme onedark'
    -- command = 'colorscheme iceberg',
    -- command = 'colorscheme github_dark',
    -- command = 'colorscheme dracula',
    -- command = 'colorscheme nord',
    -- command = 'colorscheme nightfox',
    -- command = 'colorscheme nordfox',
    -- command = 'colorscheme gruvbox',
    -- command = 'colorscheme gruvbox-material',
    -- command = 'colorscheme tokyonight',
    command = 'colorscheme solarized8',
})

-- vim-colarized8
api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    group = 'color_config',
    nested = true,
    command = 'highlight StatusLine guifg=#0c404f',
})
