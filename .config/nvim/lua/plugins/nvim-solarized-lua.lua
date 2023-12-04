local hl = vim.api.nvim_set_hl

vim.g.solarized_italics = 0

vim.cmd([[colorscheme solarized-flat]])

hl(0, 'Error', { fg = '#dc322f', bg = '#002b36' })
hl(0, 'Search', { bg = '#000000', bold = true })
hl(0, 'ErrorMsg', { fg = '#dc322f', bg= '#002b36' })
