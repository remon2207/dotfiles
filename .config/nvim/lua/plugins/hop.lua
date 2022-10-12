local status, hop = pcall(require, "hop")
if not status then
    return
end

hop.setup({
    vim.keymap.set("n", "<Leader><Leader>w", "<Cmd>HopWordMW<CR>", { noremap = true, silent = true }),
    vim.keymap.set("n", "<Leader><Leader>f", "<Cmd>HopChar2MW<CR>", { noremap = true, silent = true }),
    vim.keymap.set("n", "<Leader><Leader>h", "<Cmd>HopLineStartMW<CR>", { noremap = true, silent = true }),
    vim.keymap.set("n", "<Leader><Leader>p", "<Cmd>HopPatternMW<CR>", { noremap = true, silent = true }),
})
