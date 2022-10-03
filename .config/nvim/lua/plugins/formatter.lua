local api = vim.api
local util = require('formatter.util')

require('formatter').setup {
    filetype = {
        typescriptreact = {
            require('formatter.filetypes.typescriptreact').prettier
        },
        css = {
            require('formatter.filetypes.css').prettier
        }
    }
}

api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', "*.css", "*.scss", "*.sass", "*.json", "*.graphql", "*.md", "*.yaml", "*.html" },
    group = 'file',
    command = 'FormatWrite'
})
