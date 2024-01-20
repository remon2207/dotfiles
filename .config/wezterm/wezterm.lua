local wezterm = require('wezterm')
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end
config.font = wezterm.font_with_fallback({
  'Hack Nerd Font',
  -- 'IPAGothic',
  'Noto Sans CJK JP',
})
config.font_size = 10.0
config.color_scheme = 'Solarized (dark) (terminal.sexy)'
config.audible_bell = 'Disabled'
config.scrollback_lines = 99999999
config.default_cursor_style = 'SteadyBar'
config.front_end = 'WebGpu'
config.warn_about_missing_glyphs = false
config.use_fancy_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'
config.window_background_opacity = 1.0
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.colors = {
  tab_bar = {
    background = '#002b36',
    active_tab = {
      bg_color = '#073642',
      fg_color = '#93a1a1',
      intensity = 'Normal',
      underline = 'None',
      italic = false,
      strikethrough = false,
    },
    inactive_tab = {
      bg_color = '#002b36',
      fg_color = '#657b83',
    },
    inactive_tab_hover = {
      bg_color = '#586e75',
      fg_color = '#eee8d5',
      italic = false,
    },
    new_tab = {
      bg_color = '#073642',
      fg_color = '#93a1a1',
    },
    new_tab_hover = {
      bg_color = '#586e75',
      fg_color = '#eee8d5',
      italic = false,
    },
  },
}
config.keys = {
  { key = 'p', mods = 'CTRL|SHIFT', action = wezterm.action({ ScrollByLine = -1 }) },
  { key = 'n', mods = 'CTRL|SHIFT', action = wezterm.action({ ScrollByLine = 1 }) },
  { key = 'b', mods = 'CTRL|SHIFT', action = wezterm.action({ ScrollByPage = -1 }) },
  { key = 'f', mods = 'CTRL|SHIFT', action = wezterm.action({ ScrollByPage = 1 }) },
  { key = '?', mods = 'CTRL|SHIFT', action = wezterm.action({ Search = { CaseSensitiveString = '' } }) },
  { key = '+', mods = 'CTRL', action = wezterm.action.ResetFontSize },
  { key = '+', mods = 'CTRL|SHIFT', action = wezterm.action.ResetFontSize },
  { key = '-', mods = 'CTRL', action = wezterm.action.ResetFontSize },
  { key = '-', mods = 'CTRL|SHIFT', action = wezterm.action.ResetFontSize },
  { key = '-', mods = 'SUPER', action = wezterm.action.ResetFontSize },
  { key = '=', mods = 'CTRL', action = wezterm.action.ResetFontSize },
  { key = '=', mods = 'CTRL|SHIFT', action = wezterm.action.ResetFontSize },
  { key = '=', mods = 'SUPER', action = wezterm.action.ResetFontSize },
  { key = '_', mods = 'CTRL', action = wezterm.action.ResetFontSize },
  { key = '_', mods = 'CTRL|SHIFT', action = wezterm.action.ResetFontSize },
}

return config
