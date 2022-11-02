local status, lualine = pcall(require, 'lualine')
if not status then
    return
end

local status2, solarized_dark = pcall(require, 'lualine.themes.solarized_dark')
if not status2 then
    return
end

local status3, noice = pcall(require, 'noice')
if not status3 then
    return
end

lualine.setup({
    options = {
        theme = solarized_dark,
    },
    sections = {
        lualine_x = {
            {
                noice.api.statusline.mode.get,
                cond = noice.api.statusline.mode.has,
                color = { fg = '#ff9e64' },
            },
        },
    },
})
