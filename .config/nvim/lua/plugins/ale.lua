local g = vim.g

g.ale_linters_explicit = 1
g.ale_fixers = {
  javascript = { 'prettier' },
  javascriptreact = { 'prettier' },
  typescript = { 'prettier' },
  typescriptreact = { 'prettier' },
}

g.ale_fix_on_save = 1

g.ale_sign_column_always = 1
g.ale_echo_msg_error_str = 'E'
g.ale_echo_msg_warning_str = 'W'
g.ale_echo_msg_format = '[%linter%] (%code%): %s [%severity%]'
