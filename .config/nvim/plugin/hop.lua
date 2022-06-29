local status, hop = pcall(require, 'hop')

if (not status) then return end

hop.setup {}

vim.keymap.set('n', '<Leader><Leader>w', '<Cmd>HopWord<CR>')
vim.keymap.set('n', '<Leader><Leader>l', '<Cmd>HopLine<CR>')
