local status, telescope = pcall(require, 'telescope')

if (not status) then return end

telescope.setup {}

vim.keymap.set('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>')
