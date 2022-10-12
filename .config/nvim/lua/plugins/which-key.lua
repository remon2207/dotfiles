local status, key = pcall(require, "which-key")
if not status then
    return
end

key.setup()

vim.keymap.set("n", "<Leader>wk", "<Cmd>WhichKey<CR>", { noremap = true, silent = true })
