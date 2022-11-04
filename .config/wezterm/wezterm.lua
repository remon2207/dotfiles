local wezterm = require('wezterm')

return {
  font = wezterm.font_with_fallback({
    -- 'HackGen Console NF',
    'Source Code Pro',
  }),
  font_size = 12.0,
  color_scheme = 'Builtin Solarized Dark',
  -- window_background_opacity = 0.9,
  enable_scroll_bar = true,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  use_fancy_tab_bar = false,
  -- solarized dark
  colors = {
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
  },
  keys = {
    { key = 'p', mods = 'CTRL|SHIFT', action = wezterm.action({ ScrollByLine = -1 }) },
    { key = 'n', mods = 'CTRL|SHIFT', action = wezterm.action({ ScrollByLine = 1 }) },
    { key = 'b', mods = 'CTRL|SHIFT', action = wezterm.action({ ScrollByPage = -1 }) },
    { key = 'f', mods = 'CTRL|SHIFT', action = wezterm.action({ ScrollByPage = 1 }) },
    { key = '?', mods = 'CTRL|SHIFT', action = wezterm.action({ Search = { CaseSensitiveString = '' } }) },
    { key = 'PageUp', mods = 'CTRL|SHIFT', action = wezterm.action({ MoveTabRelative = -1 }) },
    { key = 'PageDown', mods = 'CTRL|SHIFT', action = wezterm.action({ MoveTabRelative = 1 }) },
  },
  -- warn_about_missing_glyphs = false,
}
