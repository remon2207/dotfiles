vim.g.solarized_italics = 0

vim.cmd([[colorscheme solarized-flat]])

local nvim_set_hl = vim.api.nvim_set_hl


-- nvim_set_hl(0, 'Pmenu', { fg = '#93a1a1', bg = '#073849' })
nvim_set_hl(0, 'Error', { fg = '#dc322f', bg = '#002b36' })
