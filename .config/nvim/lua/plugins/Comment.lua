local status, comment = pcall(require, 'Comment')
if not status then
  return
end

local status2, ts = pcall(require, 'ts_context_commentstring.integrations.comment_nvim')
if not status2 then
  return
end

local ft = require('Comment.ft')

ft.set('ini', ';%s')
ft.set('rasi', { '/*%s*/', '/*%s*/' })
comment.setup({
  ignore = '^$',
  pre_hook = ts.create_pre_hook(),
})

