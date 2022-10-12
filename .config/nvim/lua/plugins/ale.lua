vim.g.ale_linters_explicit = 1
vim.g.ale_fixers = {
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
}

vim.g.ale_fix_on_save = 1

vim.g.ale_sign_column_always = 1
vim.g.ale_echo_msg_error_str = "E"
vim.g.ale_echo_msg_warning_str = "W"
vim.g.ale_echo_msg_format = "[%linter%] (%code%): %s [%severity%]"
