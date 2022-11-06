local status, saga = pcall(require, 'lspsaga')

if not status then
  return
end

-- use default config
saga.init_lsp_saga({
  border_style = 'rounded',
  saga_winblend = 10,
  symbol_in_winbar = {
    enable = true,
  },
  code_action_lightbulb = {
    virtual_text = false,
  },
  server_filetype_map = {
    typescript = 'typescript',
  },
})

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
-- keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', opts)

-- Code action
-- keymap({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)

-- Rename
-- keymap('n', 'gr', '<cmd>Lspsaga rename<CR>', opts)

-- keymap('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts)
-- keymap('n', '<Leader>e', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
-- keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
-- keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)

-- Only jump to error
-- keymap('n', '[E', function()
--   require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end, opts)
-- keymap('n', ']E', function()
--   require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end, opts)

-- Outline
-- keymap('n', '<leader>o', '<cmd>LSoutlineToggle<CR>', opts)

-- Hover Doc
-- keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)

-- Float terminal
keymap('n', '<A-d>', '<cmd>Lspsaga open_floaterm<CR>', opts)
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
keymap('n', '<A-d>', '<cmd>Lspsaga open_floaterm lazygit<CR>', opts)
-- close floaterm
keymap('t', '<A-d>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], opts)
