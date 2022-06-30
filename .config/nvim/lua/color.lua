local api = vim.api

api.nvim_create_augroup('color_config', {
    clear = true
})

api.nvim_create_autocmd({ 'ColorScheme', 'VimEnter' }, {
    pattern = '*',
    group = 'color_config',
    nested = true,
    command = 'highlight Normal ctermbg=none',
    command = 'highlight LineNr ctermbg=none',
    command = 'colorscheme github_dark'
})
