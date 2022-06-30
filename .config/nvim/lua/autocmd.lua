-- 改行時の自動コメントアウトを無効化
vim.cmd[[autocmd FileType * set formatoptions-=ro]]

-- 'IMEの自動無効化
vim.cmd[[
if executable('fcitx5')
    autocmd InsertLeave * :call system('fcitx5-remote -c')
endif
]]

vim.cmd[[
augroup fileRead
    autocmd!
    " autocmd BufWritePort *.php silent! call PhpCsFixerFixFile()
    autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
augroup END
]]

vim.cmd[[
augroup fileLoad
    autocmd!
    autocmd BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx,*.json,*.yml,*.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd VimEnter tsconfig.json,jsconfig.json set ft=jsonc
augroup END
]]

-- vim.api.nvim_command('autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics({show_header=false})')


-- vim.cmd[[autocmd CursorHold * lua vim.diagnostic.open_float({scope="line"})]]
