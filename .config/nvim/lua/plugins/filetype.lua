require('filetype').setup {
    overrides = {
        extensions = {
            js = 'javascript',
            jsx = 'javascriptreact',
            ts = 'typescript',
            tsx = 'typescriptreact',
            json = 'json',
            lua = 'lua',
            vim = 'vim'
        },
        complex = {
            ['tsconfig.json'] = 'jsonc',
            ['jsconfig.json'] = 'jsonc'
        }
    }
}
