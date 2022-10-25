local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local status2, solarized_dark = pcall(require, 'lualine.themes.solarized_dark')
if not status2 then
    return
end

lualine.setup({
    options = {
        -- section_separators = { left = "", right = " " },
        theme = 'solarized_dark'
    },
})
