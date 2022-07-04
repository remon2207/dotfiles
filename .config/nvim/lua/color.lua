local api = vim.api

api.nvim_create_augroup('color_config', {
    clear = true
})

api.nvim_create_autocmd({ 'ColorScheme', 'VimEnter' }, {
    pattern = '*',
    group = 'color_config',
    nested = true,
    command = 'highlight Normal ctermbg=NONE',
    command = 'highlight LineNr ctermbg=NONE',
    command = 'colorscheme dracula',
    -- command = 'colorscheme onedark',
})
