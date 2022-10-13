-- ESCキー2度押しでハイライトの有無の切り替え
vim.keymap.set("n", "<Esc><Esc>", "<Cmd>set nohlsearch!<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })

vim.keymap.set("t", "<Esc>", "<C-|><C-n>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", "<Cmd>terminal<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "ss", "<Cmd>split<CR><C-w>w", { noremap = true, silent = true })
vim.keymap.set("n", "sv", "<Cmd>vsplit<CR><C-w>w", { noremap = true, silent = true })

vim.keymap.set("n", "tn", "<Cmd>tabnew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "tl", "<Cmd>tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "th", "<Cmd>tabprevious<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "sh", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "sj", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "sk", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "sl", "<C-w>l", { noremap = true, silent = true })

vim.keymap.set("i", "<C-d>", "<Del>", { noremap = true, silent = true })

vim.keymap.set("n", "fh", "<Cmd>bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "fl", "<Cmd>bnext<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-z>", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
