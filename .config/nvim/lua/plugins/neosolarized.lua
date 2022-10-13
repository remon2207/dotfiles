local status, n = pcall(require, "neosolarized")
if not status then
    return
end

n.setup({
    comment_italics = false,
})

local status, colorbuddy = pcall(require, "colorbuddy")
if not status then
    return
end

colorbuddy.setup()

