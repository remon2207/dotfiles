local status, telescope = pcall(require, 'telescope')
if not status then
  return
end

local a = require('telescope.actions')
local nvim_set_hl = vim.api.nvim_set_hl
local fb_actions = telescope.extensions.file_browser.actions
local opts = { noremap = true, silent = true }

local defaults = {
  winblend = 25,
  file_ignore_patterns = { '/.git/', '/node_modules/' },
  vimgrep_arguments = {
    'rg',
    '--color=auto',
    '--no-heading',
    '--with-filename',
    '--line-number',
    '--column',
    '--smart-case',
    '--hidden',
  },
  mappings = {
    i = {
      ['<C-j>'] = a.move_selection_next,
      ['<C-k>'] = a.move_selection_previous,
      ['<C-o>'] = false,
    },
    n = {
      ['q'] = a.close,
      ['o'] = false,
      ['N'] = fb_actions.create,
      ['c'] = false,
      ['h'] = fb_actions.goto_parent_dir,
      ['d'] = false,
      ['D'] = fb_actions.remove,
    },
  },
}

local extensions = {
  file_browser = {
    hijack_netrw = true,
    hidden = true,
    follow_symlinks = true,
  },
}

telescope.setup({
  defaults = defaults,
  extensions = extensions,
})

telescope.load_extension('file_browser')

vim.keymap.set('n', '<C-n>', '<Cmd>Telescope file_browser<CR>', opts)
vim.keymap.set('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>', opts)
vim.keymap.set('n', '<Leader>fb', '<Cmd>Telescope buffers <CR>', opts)
vim.keymap.set('n', '<Leader>fh', '<Cmd>Telescope help_tags<CR>', opts)

nvim_set_hl(0, 'TelescopeSelection', { bg = '#073642', bold = true })
