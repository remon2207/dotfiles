local api = vim.api

-- vim.g.solarized_italics = false
-- vim.cmd([[colorscheme solarized]])

-- vim.cmd([[colorscheme onedark]])
-- vim.cmd([[colorscheme iceberg]])

vim.cmd([[colorscheme base16-solarized-dark]])
-- api.nvim_set_hl(0, 'TSComment', { italic = false, fg = '#657b83' })
-- api.nvim_set_hl(0, 'NeoTreeGitConflict', { italic = false, bold = true, fg = '#ff8700' })
-- api.nvim_set_hl(0, 'NeoTreeRootName', { italic = false, bold = true })
-- api.nvim_set_hl(0, 'NeoTreeGitUntracked', { italic = false, fg = '#ff8700' })
-- api.nvim_set_hl(0, 'TSTypeBuiltin', { italic = false, fg = '#b58900' })
api.nvim_set_hl(0, 'TelescopeBorder', { fg = '#859900' })
api.nvim_set_hl(0, 'TelescopePromptTitle', { link = 'TelescopeTitle' })
api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = 'none' })
api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = 'none' })
api.nvim_set_hl(0, 'TelescopePromptPrefix', { bg = 'none' })
api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#073642', bold = true })
api.nvim_set_hl(0, 'TelescopeResultsTitle', { link = 'TelescopeTitle' })
api.nvim_set_hl(0, 'TelescopePreviewTitle', { link = 'TelescopeTitle' })
