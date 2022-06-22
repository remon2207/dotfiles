local wezterm = require 'wezterm';

return {
  font = wezterm.font_with_fallback({
    -- {
    --   family='JetBrainsMono Nerd Font',
    --   harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    -- },
    -- {
    --   family='FiraCode Nerd Font',
    --   harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    -- },
    -- {
    --   family='Inconsolata Nerd Font',
    --   harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    -- },
    -- 'FiraCode Nerd Font',
    -- 'MesloLGM Nerd Font',
    -- 'MesloLGL Nerd Font',
    -- 'MesloLGS Nerd Font',
    -- 'Inconsolata',
    -- 'Migu 1M',
    -- 'NotoSans Nerd Font',
    -- 'IBM Plex Sans JP'
    -- 'SauceCodePro Nerd Font',
    -- 'Source Han Code JP',
    -- 'HackGen35 Console',
    -- 'HackGenNerd Console'
    -- 'HackGen',
    -- 'HackGenNerd',
    'Cica'
    -- 'Gen Shin Gothic Monospace',
    -- 'Ricty',
    -- 'PlemolJP',
    -- 'PlemolJP Console NF',
    -- 'PlemolJP Console',
    -- 'PlemolJP',
    -- {family='PlemolJP Console', weight='Regular'},
    -- 'Ricty Nerd Font'
    -- 'RictyDiscord Nerd Font'
    -- 'Source Han Code JP'
  }),
  -- font_size = 10.0,
  font_size = 12.0,
  -- color_scheme = 'Dracula',
  -- color_scheme = 'Hybrid',
  color_scheme = 'OneHalfDark',
  -- color_scheme = 'Atom',
  -- color_scheme = 'Brogrammer',
  -- color_scheme = 'iceberg-dark',
  -- color_scheme = 'Molokai',
  -- color_scheme = 'Monokai Remastered',
  -- color_scheme = 'Monokai Soda',
  -- color_scheme = 'monokai Vivid',
  -- color_scheme = 'nord',
  -- color_scheme = 'Solarized Dark - Patched',
  -- color_scheme = 'Gruvbox Dark',
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
    {key = "[", mods = "CTRL", action=wezterm.action{ActivateTabRelative=-1}},
    {key = "]", mods = "CTRL", action=wezterm.action{ActivateTabRelative=1}},
    {key = "p", mods = "CTRL|SHIFT", action=wezterm.action{ScrollByLine=-1}},
    {key = "n", mods = "CTRL|SHIFT", action=wezterm.action{ScrollByLine=1}},
    {key = "b", mods = "CTRL|SHIFT", action=wezterm.action{ScrollByPage=-1}},
    {key = "f", mods = "CTRL|SHIFT", action=wezterm.action{ScrollByPage=1}},
    {key = "?", mods = "CTRL|SHIFT", action =wezterm.action{Search={CaseSensitiveString=""}}},
  },
  -- disable_default_key_bindings = true,
  exit_behavior = 'Close',
  show_tab_index_in_tab_bar = false,
  warn_about_missing_glyphs = false
}
