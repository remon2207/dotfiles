local buf_keymap = vim.api.nvim_buf_set_keymap

vim.keymap.set('n', '<C-n>', '<Cmd>Fern . -reveal=%<CR>', { noremap = true, silent = true })

vim.g['fern#renderer'] = 'nerdfont'
vim.g['fern#default_hidden'] = 1
vim.g['fern#disable_default_mappings'] = 1

function init_fern()
    buf_keymap(0, 'n', 'l', '<Plug>(fern-action-open-or-expand)', { noremap = false, silent = true })
    buf_keymap(0, 'n', 'h', '<Plug>(fern-action-open-or-enter)', { noremap = false, silent = true })
    buf_keymap(0, 'n', 'N', '<Plug>(fern-action-new-file)', { noremap = false, silent = true })
    buf_keymap(0, 'n', 'K', '<Plug>(fern-action-new-dir)', { noremap = false, silent = true })
    buf_keymap(0, 'n', 'd', '<Plug>(fern-action-remove)', { noremap = false, silent = true })
    buf_keymap(0, 'n', 'g', '<Plug>(fern-action-grep)', { noremap = false, silent = true })
    buf_keymap(0, 'n', 'h', '<Plug>(fern-action-collapse)', { noremap = false, silent = true })
    buf_keymap(0, 'n', 'R', '<Plug>(fern-action-rename)', { noremap = true, silent = true })
    buf_keymap(0, 'n', 'm', '<Plug>(fern-action-move)', { noremap = true, silent = true })
end

vim.api.nvim_create_augroup('fern_custom', {
    clear = true
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'fern',
    group = 'fern_custom',
    callback = function()
        init_fern()
    end
})
