local api = vim.api

-- 改行時の自動コメントアウトを無効化
api.nvim_create_autocmd('FileType', {
    pattern = '*',
    command = 'set formatoptions-=ro'
})

-- 'IMEの自動無効化
api.nvim_create_autocmd('InsertLeave', {
    pattern = '*',
    callback = function()
        if os.execute('fcitx5 2> /dev/null') then
            api.nvim_exec('call system("fcitx5-remote -c")', true)
        end
    end
})

api.nvim_create_augroup('file', {
    clear = true
})

api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
    group = 'file',
    command = 'EslintFixAll'
})


api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', '*.json', '*.yml', '*.vim' },
    group = 'file',
    command = 'setlocal tabstop=2 softtabstop=2 shiftwidth=2',
})

api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = { 'tsconfig.json', 'jsconfig.json' },
    group = 'file',
    command = 'setlocal ft=jsonc'
})
