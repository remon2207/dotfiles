local status, noice = pcall(require, 'noice')
if not status then
    return
end

noice.setup()

local status2, telescope = pcall(require, 'telescope')
if not status2 then
    return
end

telescope.load_extension('noice')

vim.keymap.set('n', '<leader>nl', function()
    require('noice').cmd('last')
end)

vim.keymap.set('n', '<leader>nh', function()
    require('noice').cmd('history')
end)
