local status, ibl = pcall(require, 'ibl')
if not status then
  return
end
local hooks = require('ibl.hooks')

local nvim_set_hl = vim.api.nvim_set_hl

local indent = {
  char = '▏',
  tab_char = '>',
  smart_indent_cap = false,
}
local highlight = {
  'RainbowRed',
  'RainbowYellow',
  'RainbowBlue',
  'RainbowOrange',
  'RainbowGreen',
  'RainbowViolet',
  'RainbowCyan',
}
local scope = {
  highlight = highlight,
}

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
  nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
  nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
  nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
  nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
  nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
  nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
end)

ibl.setup({
  indent = indent,
  scope = scope,
})

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
