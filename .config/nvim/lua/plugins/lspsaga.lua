local status, saga = pcall(require, 'lspsaga')

if not status then
  return
end

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

saga.setup({
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = 'round',
})

-- Rename
keymap('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
-- Code action
keymap({ 'n', 'v' }, '<leader>ca', '<Cmd>Lspsaga code_action<CR>', opts)
-- Hover Doc
keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
-- diagnostic
keymap('n', '<Leader>e', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
keymap('n', 'gj', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
keymap('n', 'gk', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
-- signature_help
keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
-- scroll
keymap('n', '<C-u>', "<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<C-u>')<CR>", opts)
keymap('n', '<C-d>', "<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<C-d>')<CR>", opts)

keymap('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)

-- Float terminal
-- keymap('n', '<A-d>', '<Cmd>Lspsaga open_floaterm<CR>', opts)
-- open lazygit in lspsaga float terminal
-- keymap('n', '<A-d>', '<Cmd>Lspsaga open_floaterm lazygit<CR>', opts)
-- close floaterm
-- keymap('t', '<A-d>', [[<C-\><C-n><Cmd>Lspsaga close_floaterm<CR>]], opts)
