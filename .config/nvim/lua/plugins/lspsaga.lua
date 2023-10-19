local status, saga = pcall(require, 'lspsaga')

if not status then
  return
end

local keymap = vim.keymap.set
local nvim_set_hl = vim.api.nvim_set_hl
local opts = { noremap = true, silent = true }

saga.setup({
  error_sign = 'E',
  warn_sign = 'W',
  hint_sign = 'H',
  infor_sign = 'I',
  border_style = 'round',
  code_action_icon = ' ',
  code_action_prompt = {
    virtual_text = false,
  },
})

-- Rename
keymap('n', '<Leader>rn', '<Cmd>Lspsaga rename<CR>', opts)
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

nvim_set_hl(0, 'LspSagaFinderSelection', { fg = '#89d957', bg = 'none', bold = true })
nvim_set_hl(0, 'LspFloatWinBorder', { fg = 'black', bg = 'none' })
nvim_set_hl(0, 'LspSagaBorderTitle', { fg = 'orange', bg = 'none', bold = true })
nvim_set_hl(0, 'LspFloatWinNormal', { link = 'Normal' })
nvim_set_hl(0, 'ReferencesCount', { link = 'Title' })
nvim_set_hl(0, 'DefinitionCount', { link = 'Title' })
nvim_set_hl(0, 'TargetFileName', { link = 'Comment' })
nvim_set_hl(0, 'DefinitionIcon', { link = 'Special' })
nvim_set_hl(0, 'ReferencesIcon', { link = 'Special' })
nvim_set_hl(0, 'ProviderTruncateLine', { fg = 'black', bg = 'none' })
nvim_set_hl(0, 'SagaShadow', { bg = '#000000' })
nvim_set_hl(0, 'LspSagaFinderSelection', { fg = '#89d957', bg = 'none', bold = true })
nvim_set_hl(0, 'DiagnosticTruncateLine', { fg = '#6699cc', bg = 'none', bold = true })
nvim_set_hl(0, 'DiagnosticError', { link = 'Error' })
nvim_set_hl(0, 'DiagnosticWarning', { link = 'WarningMsg' })
nvim_set_hl(0, 'DiagnosticInformation', { fg = '#6699cc', bg = 'none', bold = true })
nvim_set_hl(0, 'DiagnosticHint', { fg = '#56b6c2', bg = 'none', bold = true })
nvim_set_hl(0, 'DefinitionPreviewTitle', { link = 'Title' })
nvim_set_hl(0, 'LspSagaDiagnosticBorder', { fg = '#7739e3', bg = 'none' })
nvim_set_hl(0, 'LspSagaDiagnosticHeader', { fg = '#d8a657', bg = 'none', bold = true })
nvim_set_hl(0, 'LspSagaDiagnosticTruncateLine', { fg = '#7739e3', bg = 'none' })
nvim_set_hl(0, 'LspDiagnosticsFloatingError', { fg = '#ec5f67', bg = 'none' })
nvim_set_hl(0, 'LspDiagnosticsFloatingWarn', { fg = '#d8a657', bg = 'none' })
nvim_set_hl(0, 'LspDiagnosticsFloatingInfor', { fg = '#6699cc', bg = 'none' })
nvim_set_hl(0, 'LspDiagnosticsFloatingHint', { fg = '#56b6c2', bg = 'none' })
nvim_set_hl(0, 'LspSagaShTruncateLine', { fg = 'black', bg = 'none' })
nvim_set_hl(0, 'LspSagaDocTruncateLine', { fg = 'black', bg = 'none' })
nvim_set_hl(0, 'LspSagaCodeActionTitle', { fg = '#da8548', bg = 'none', bold = true })
nvim_set_hl(0, 'LspSagaCodeActionTruncateLine', { fg = 'black', bg = 'none' })
nvim_set_hl(0, 'LspSagaCodeActionContent', { fg = '#98be65', bg = 'none', bold = true })
nvim_set_hl(0, 'LspSagaRenamePromptPrefix', { fg = '#98be65', bg = 'none' })
nvim_set_hl(0, 'LspSagaRenameBorder', { fg = '#3bb6c4', bg = 'none' })
nvim_set_hl(0, 'LspSagaHoverBorder', { fg = '#80A0C2', bg = 'none' })
nvim_set_hl(0, 'LspSagaSignatureHelpBorder', { fg = '#98be65', bg = 'none' })
nvim_set_hl(0, 'LspSagaLspFinderBorder', { fg = '#51afef', bg = 'none' })
nvim_set_hl(0, 'LspSagaCodeActionBorder', { fg = '#b3deef', bg = 'none' })
nvim_set_hl(0, 'LspSagaAutoPreview', { fg = '#ECBE7B', bg = 'none' })
nvim_set_hl(0, 'LspSagaDefPreviewBorder', { fg = '#b3deef', bg = 'none' })
nvim_set_hl(0, 'LspSagaLightBulb', { link = 'LspDiagnosticsSignHint' })
