local status, n = pcall(require, "neosolarized")
if not status then
    return
end

n.setup({
    comment_italics = false,
})

local cb = require('colorbuddy.init')
local colors = cb.colors
local Group = cb.Group

Group.new('Normal', colors.none, colors.base03)
