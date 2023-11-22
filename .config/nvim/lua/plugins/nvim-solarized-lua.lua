local nvim_set_hl = vim.api.nvim_set_hl

vim.g.solarized_italics = 0

vim.cmd([[colorscheme solarized-flat]])

nvim_set_hl(0, 'Error', { fg = '#dc322f', bg = '#002b36' })
nvim_set_hl(0, 'Search', { bg = '#000000', bold = true })
