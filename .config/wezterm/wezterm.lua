local wezterm = require('wezterm')

return {
  font = wezterm.font_with_fallback {
    -- 'Ricty',
    -- 'Hermit',
    -- 'Hurmit Nerd Font',
    -- {
    --   family='JetBrains Mono',
    --   harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    -- },
    -- 'JetBrains Mono',
    -- {
    --   family='JetBrainsMono Nerd Font',
    --   harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    -- },
    -- 'Hack',
    -- 'Hack Nerd Font',
    -- {
    --   family='Fira Code',
    --   harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    -- },
    -- 'Cascadia Code',
    -- 'CaskaydiaCove Nerd Font',
    -- {
    --   family='CaskaydiaCove Nerd Font',
    --   harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    -- },
    -- {
    --   family='Fira Code',
    --   harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    -- },
    -- {
    --   family='firacode nerd font',
    --   harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    -- },
    -- {
    --   family='InconsolataGo Nerd Font',
    --   harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    -- },
    -- 'HackGen',
    -- 'Inconsolata',
    -- 'Inconsolata Nerd Font',
    -- {
    --   family='Inconsolata Nerd Font',
    --   harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    -- },
    -- 'Source Code Pro',
    -- {
    --     family='SauceCodePro Nerd Font',
    --     harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    -- },
    -- 'IBM Plex Mono',
    -- 'Hack Nerd Font',
    -- 'Source Han Code JP',
    -- 'FiraCode Nerd Font',
    -- 'MesloLGM Nerd Font',
    -- 'MesloLGL Nerd Font',
    -- 'MesloLGS Nerd Font',
    -- 'Inconsolata',
    -- 'Migu 1M',
    -- { family = 'Migu 1M', weight = 'Bold' },
    -- { family='Migu 1M', weight='Bold'},
    -- 'NotoSans Nerd Font',
    -- 'IBM Plex Sans JP'
    -- 'SauceCodePro Nerd Font',
    -- 'Source Han Code JP',
    -- 'HackGen35 Console',
    -- 'HackGenNerd Console',
    -- 'HackGen',
    -- { family = 'HackGen', weight = 'Bold' },
    -- 'HackGen35',
    'HackGenNerd',
    -- 'Roboto Mono',
    -- 'Cica',
    -- { family = 'Cica', weight = 'Bold' },
    -- { family = 'Cica' },
    -- 'Gen Shin Gothic Monospace',
    -- 'Ricty',
    -- 'PlemolJP',
    -- 'PlemolJP Console NF',
    -- 'PlemolJP Console',
    -- 'PlemolJP',
    -- 'PlemolJP35',
    -- {family='PlemolJP Console NF', weight='Regular'},
    -- 'Ricty Nerd Font'
    -- 'RictyDiscord Nerd Font'
  },
  -- font_size = 7.0,
  -- font_size = 8.0,
  -- font_size = 9.0,
  -- font_size = 10.0,
  -- font_size = 11.0,
  font_size = 12.0,
  -- font_size = 14.0,
  -- color_scheme = 'Dracula',
  -- color_scheme = 'Hybrid',
  -- color_scheme = 'OneHalfDark',
  -- color_scheme = 'DoomOne',
  -- color_scheme = 'GitHub Dark',
  -- color_scheme = 'Atom',
  -- color_scheme = 'Brogrammer',
  -- color_scheme = 'iceberg-dark',
  -- color_scheme = 'tokyonight-storm',
  -- color_scheme = 'tokyonight',
  -- color_scheme = 'Molokai',
  -- color_scheme = 'Monokai Remastered',
  -- color_scheme = 'Monokai Soda',
  -- color_scheme = 'monokai Vivid',
  -- color_scheme = 'nord',
  -- color_scheme = 'Solarized Dark - Patched',
  -- color_scheme = 'Builtin Solarized Dark',
  color_scheme = 'Gruvbox Dark',
  freetype_load_target = 'Light',
  freetype_render_target = 'Light',
  window_background_opacity = 0.9,
  enable_scroll_bar = true,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  use_fancy_tab_bar = false,
  -- iceberg
  -- colors = {
  --   tab_bar = {
  --     background = "#1e2132",
  --     active_tab = {
  --       bg_color = "#3d425b",
  --       fg_color = "#c6c8d1",
  --       intensity = "Normal",
  --       underline = "None",
  --       italic = false,
  --       strikethrough = false,
  --     },
  --     inactive_tab = {
  --       bg_color = "#242940",
  --       fg_color = "#808080",
  --     },
  --     inactive_tab_hover = {
  --       bg_color = "#3e445e",
  --       fg_color = "#c6c8d1",
  --       italic = false,
  --     },
  --     new_tab = {
  --       bg_color = "#515e97",
  --       fg_color = "#c6c8d1",
  --     },
  --     new_tab_hover = {
  --       bg_color = "#515e97",
  --       fg_color = "#c6c8d1",
  --       italic = false,
  --     }
  --   },
  -- },
  -- Nord
  -- colors = {
  --   tab_bar = {
  --     background = "#2E3440",
  --     active_tab = {
  --       bg_color = "#4C566A",
  --       fg_color = "#ECEFF4",
  --       intensity = "Normal",
  --       underline = "None",
  --       italic = false,
  --       strikethrough = false,
  --     },
  --     inactive_tab = {
  --       bg_color = "#3B4252",
  --       fg_color = "#D8DEE9",
  --     },
  --     inactive_tab_hover = {
  --       bg_color = "#434C5E",
  --       fg_color = "#E5E9F0",
  --       italic = false,
  --     },
  --     new_tab = {
  --       bg_color = "#434C5E",
  --       fg_color = "#D8DEE9",
  --     },
  --     new_tab_hover = {
  --       bg_color = "#4C566A",
  --       fg_color = "#E5E9F0",
  --       italic = false,
  --     }
  --   },
  -- },
  -- Dracula
  -- colors = {
  --   tab_bar = {
  --     background = "#282a36",
  --     active_tab = {
  --       bg_color = "#44475a",
  --       fg_color = "#f8f8f2",
  --       intensity = "Normal",
  --       underline = "None",
  --       italic = false,
  --       strikethrough = false,
  --     },
  --     inactive_tab = {
  --       bg_color = "#242940",
  --       fg_color = "#6272a4",
  --     },
  --     inactive_tab_hover = {
  --       bg_color = "#3e445e",
  --       fg_color = "#f8f8f2",
  --       italic = false,
  --     },
  --     new_tab = {
  --       bg_color = "#44475a",
  --       fg_color = "#f8f8f2",
  --     },
  --     new_tab_hover = {
  --       bg_color = "#6272a4",
  --       fg_color = "#f8f8f2",
  --       italic = false,
  --     }
  --   },
  -- },
  keys = {
    -- {key = "[", mods = "CTRL", action=wezterm.action{ActivateTabRelative=-1}},
    -- {key = "]", mods = "CTRL", action=wezterm.action{ActivateTabRelative=1}},
    {key = "p", mods = "CTRL|SHIFT", action=wezterm.action{ScrollByLine=-1}},
    {key = "n", mods = "CTRL|SHIFT", action=wezterm.action{ScrollByLine=1}},
    {key = "b", mods = "CTRL|SHIFT", action=wezterm.action{ScrollByPage=-1}},
    {key = "f", mods = "CTRL|SHIFT", action=wezterm.action{ScrollByPage=1}},
    {key = "?", mods = "CTRL|SHIFT", action =wezterm.action{Search={CaseSensitiveString=""}}},
    {key = "PageUp", mods = "CTRL|SHIFT", action=wezterm.action{MoveTabRelative=-1}},
    {key = "PageDown", mods = "CTRL|SHIFT", action=wezterm.action{MoveTabRelative=1}},
  },
  -- disable_default_key_bindings = true,
  -- exit_behavior = 'Close',
  -- warn_about_missing_glyphs = false
}
