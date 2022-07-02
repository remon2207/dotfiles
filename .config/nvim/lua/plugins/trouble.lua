require('trouble').setup {
    mode = 'document_diagnostics',
    vim.keymap.set('n', '<Leader>dt', '<Cmd>TroubleToggle<CR>'),
    vim.api.nvim_create_autocmd('BufEnter', {
        pattern = '*',
        command = 'TroubleRefresh'
    })
}
