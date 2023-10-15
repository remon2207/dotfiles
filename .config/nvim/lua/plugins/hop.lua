local status, hop = pcall(require, 'hop')
if not status then
  return
end

local opts = { noremap = true, silent = true }

hop.setup({
  vim.keymap.set('n', '<Leader><Leader>w', '<Cmd>HopWordMW<CR>', opts),
  vim.keymap.set('n', '<Leader><Leader>f', '<Cmd>HopChar2MW<CR>', opts),
  vim.keymap.set('n', '<Leader><Leader>h', '<Cmd>HopLineStartMW<CR>', opts),
  vim.keymap.set('n', '<Leader><Leader>p', '<Cmd>HopPatternMW<CR>', opts),
})
