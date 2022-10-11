local status, toggleterm = pcall(require, "toggleterm")
if not status then
	return
end

toggleterm.setup({
	direction = "float",
})

vim.keymap.set("n", "<Leader>ft", "<Cmd>ToggleTerm<CR>", { noremap = true, silent = true })
