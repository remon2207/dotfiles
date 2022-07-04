local api = vim.api

api.nvim_create_augroup('my-glyph-palette', {
    clear = true
})

api.nvim_create_autocmd('FileType', {
    pattern = { 'fern', 'nerdtree', 'startify' },
    group = 'my-glyph-palette',
    command = 'call glyph_palette#apply()',
    command = 'call glyph_palette#apply()'
})