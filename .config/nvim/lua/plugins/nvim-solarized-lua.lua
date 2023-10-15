vim.cmd([[colorscheme solarized-flat]])

local nvim_set_hl = vim.api.nvim_set_hl

nvim_set_hl(0, 'Error', { fg = '#dc322f', bg = '#002b36' })
