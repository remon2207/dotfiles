local wezterm = require('wezterm')
local act = wezterm.action
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback({
  'Hack Nerd Font',
  'Noto Sans Mono CJK JP',
})
config.font_size = 10.0
config.color_scheme = 'Solarized (dark) (terminal.sexy)'
config.audible_bell = 'Disabled'
config.scrollback_lines = 99999999
config.front_end = 'WebGpu'
config.use_fancy_tab_bar = false
config.animation_fps = 165
config.max_fps = 165
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = 'NeverPrompt'
config.window_background_opacity = 1.0
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.set_environment_variables = {
  BROWSER = 'google-chrome-stable',
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
  { key = 'p', mods = 'SHIFT|CTRL', action = act({ ScrollByLine = -1 }) },
  { key = 'n', mods = 'SHIFT|CTRL', action = act({ ScrollByLine = 1 }) },
  { key = 'b', mods = 'SHIFT|CTRL', action = act({ ScrollByPage = -1 }) },
  { key = 'f', mods = 'SHIFT|CTRL', action = act({ ScrollByPage = 1 }) },
  { key = '?', mods = 'SHIFT|CTRL', action = act({ Search = { CaseSensitiveString = '' } }) },
  { key = ')', mods = 'CTRL', action = act.DisableDefaultAssignment },
  { key = ')', mods = 'SHIFT|CTRL', action = act.DisableDefaultAssignment },
  { key = '+', mods = 'CTRL', action = act.DisableDefaultAssignment },
  { key = '+', mods = 'SHIFT|CTRL', action = act.DisableDefaultAssignment },
  { key = '-', mods = 'CTRL', action = act.DisableDefaultAssignment },
  { key = '-', mods = 'SHIFT|CTRL', action = act.DisableDefaultAssignment },
  { key = '-', mods = 'SUPER', action = act.DisableDefaultAssignment },
  { key = '0', mods = 'CTRL', action = act.DisableDefaultAssignment },
  { key = '0', mods = 'SHIFT|CTRL', action = act.DisableDefaultAssignment },
  { key = '0', mods = 'SUPER', action = act.DisableDefaultAssignment },
  { key = '=', mods = 'CTRL', action = act.DisableDefaultAssignment },
  { key = '=', mods = 'SHIFT|CTRL', action = act.DisableDefaultAssignment },
  { key = '=', mods = 'SUPER', action = act.DisableDefaultAssignment },
  { key = '_', mods = 'CTRL', action = act.DisableDefaultAssignment },
  { key = '_', mods = 'SHIFT|CTRL', action = act.DisableDefaultAssignment },
}

return config
