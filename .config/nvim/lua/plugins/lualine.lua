local status, lualine = pcall(require, 'lualine')
if not status then
  return
end

local status2, solarized_dark = pcall(require, 'lualine.themes.solarized_dark')
if not status2 then
  return
end

solarized_dark.normal.b.fg = '#93a1a1'
solarized_dark.normal.b.bg = '#073642'

local options = {
  theme = solarized_dark,
}

lualine.setup({
  options = options,
})
