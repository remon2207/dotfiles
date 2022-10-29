local status, base16 = pcall(require, 'mini.base16')
if not status then
    return
end

local base16_solarized = {
    base00 = '#002b36',
    base01 = '#073642',
    base02 = '#586e75',
    base03 = '#657b83',
    base04 = '#839496',
    base05 = '#93a1a1',
    base06 = '#eee8d5',
    base07 = '#fdf6e3',
    base08 = '#b58900',
    base09 = '#cb4b16',
    base0A = '#dc322f',
    base0B = '#d33682',
    base0C = '#6c71c4',
    base0D = '#268bd2',
    base0E = '#2aa198',
    base0F = '#859900',
}

base16.setup({
    palette = base16_solarized,
    use_cterm = false,
})

local api = vim.api

api.nvim_set_hl(0, 'Floatborder', { bg = 'none', fg = '#073642' })
api.nvim_set_hl(0, 'CursorLineNr', { fg = '#b58900', ctermfg = 11 })
-- NotifyINFOBorderxxx guifg=#6c71c4
-- api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = '#6c71c4', bg = 'none', ctermbg = 'none'})
-- NoiceCmdlinePopupBorder
-- api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', { bg = 'none', ctermbg = 'none'} )
