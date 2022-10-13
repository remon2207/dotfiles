local status, lualine = pcall(require, "lualine")
if not status then
    return
end

lualine.setup({
    -- options = {
        -- theme = "neosolarized"
    --     -- icons_enabled = true,
    --     -- section_separators = { left = "", right = " " },
    -- },
})
