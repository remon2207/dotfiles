local status, indent = pcall(require, 'indent_blankline')
if not status then
    return
end

-- vim.cmd([[highlight IndentBlanklineIndent guifg=#586e75 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent guifg=#094655 gui=nocombine]])

vim.g.indent_blankline_char_blankline = ''
vim.g.indent_blankline_use_treesitter = true

indent.setup({
    char_highlight_list = {
        'IndentBlanklineIndent',
    },
})
