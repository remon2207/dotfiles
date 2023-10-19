local status, hop = pcall(require, 'hop')
if not status then
  return
end

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

hop.setup({
  keymap('n', '<Leader><Leader>w', '<Cmd>HopWordMW<CR>', opts),
  keymap('n', '<Leader><Leader>f', '<Cmd>HopChar2MW<CR>', opts),
  keymap('n', '<Leader><Leader>h', '<Cmd>HopLineStartMW<CR>', opts),
  keymap('n', '<Leader><Leader>p', '<Cmd>HopPatternMW<CR>', opts),
})
