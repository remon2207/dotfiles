local status, indent = pcall(require, 'indent_blankline')
if not status then
    return
end

indent.setup({
    char_highlight_list = {
        'IndentBlanklineIndent1',
    },
})

vim.cmd([[highlight IndentBlanklineIndent1 guifg=#586e75 gui=nocombine]])

vim.g.indent_blankline_char_blankline = ''
vim.g.indent_blankline_use_treesitter = true
