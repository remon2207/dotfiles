-- require('indent_blankline').setup {}

vim.cmd[[highlight IndentBlanklineIndent1 guifg=#595959 gui=nocombine]]

require('indent_blankline').setup {
    char_highlight_list = {
        'IndentBlanklineIndent1',
    },
}
