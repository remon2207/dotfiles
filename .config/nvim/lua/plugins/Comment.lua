local status, comment = pcall(require, 'Comment')
if not status then
    return
end

comment.setup()

local ft = require('Comment.ft')

ft({ 'javascriptreact', 'typescriptreact' }, '{/*%s*/}')
