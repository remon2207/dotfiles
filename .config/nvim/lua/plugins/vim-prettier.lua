vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = {'*.js', '*.jsx', '*.mjs', '*.ts', '*.tsx', '*.css', '*.less', '*.scss', '*.json', '*.graphql', '*.md', '*.vue', '*.svelte', '*.yaml', '*.html'},
    command = 'PrettierAsync'
})