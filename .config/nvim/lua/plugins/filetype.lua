require('filetype').setup {
    overrides = {
        extensions = {
            js = 'javascript',
            jsx = 'javascriptreact',
            ts = 'typescript',
            tsx = 'typescriptreact',
            lua = 'lua',
            vim = 'vim',
            snippets = 'snippets',
        },
        complex = {
            ['*.json'] = 'json',
            ['tsconfig.json'] = 'jsonc',
            ['jsconfig.json'] = 'jsonc',
        }
    }
}
