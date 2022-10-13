local api = vim.api

api.nvim_create_augroup("color_config", {
    clear = true,
})

-- vim-colarized8
-- api.nvim_create_autocmd('VimEnter', {
--     pattern = '*',
--     group = 'color_config',
--     nested = true,
--     command = 'colorscheme solarized8'
-- })

-- vim.cmd([[colorscheme iceberg]])
-- vim.cmd([[colorscheme solarized8]])
-- vim.cmd([[colorscheme NeoSolarized]])
-- vim.cmd([[colorscheme neosolarized]])
