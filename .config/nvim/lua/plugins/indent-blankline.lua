local status, indent = pcall(require, "indent_blankline")
if not status then
	return
end

indent.setup()

vim.cmd([[highlight IndentBlanklineIndent1 guifg=#586e75 gui=nocombine]])

require("indent_blankline").setup({
	char_highlight_list = {
		"IndentBlanklineIndent1",
	},
})

vim.g.indent_blankline_char_blankline = ""
