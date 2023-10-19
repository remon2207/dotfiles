local status, toggleterm = pcall(require, 'toggleterm')
if not status then
  return
end

local float_opts = {
  border = 'rounded',
}

toggleterm.setup({
  direction = 'float',
  float_opts = float_opts,
})

local Terminal = require('toggleterm.terminal').Terminal
-- local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })
local lazygit = Terminal:new({ cmd = '~/.config/lazygit/symlink_workaround.sh', hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

-- vim.keymap.set('n', '<Leader>ft', '<Cmd>ToggleTerm<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<Leader>g', '<Cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
