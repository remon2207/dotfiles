local wezterm = require 'wezterm';

return {
  font = wezterm.font_with_fallback({
    -- {
    --   family='JetBrainsMono Nerd Font',
    --   harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    -- },
    {
      family='FiraCode Nerd Font',
      harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    },
    -- 'HackGenNerd Console',
    -- 'PlemolJP Console NF'
    -- 'Ricty Nerd Font'
    -- 'RictyDiscord Nerd Font'
    -- {family='RictyDiscord Nerd Font', weight='Bold'}
    'Source Han Code JP'
  }),
  font_size = 12.0,
  -- color_scheme = 'iceberg-dark',
  color_scheme = 'Solarized Dark - Patched',
  window_background_opacity = 0.9,
  enable_scroll_bar = true,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  use_fancy_tab_bar = false,
  colors = {
    tab_bar = {
      background = "#002b36",
      active_tab = {
        bg_color = "#586e75",
        fg_color = "#fdf6e3",
        intensity = "Normal",
        underline = "None",
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = "#073642",
        fg_color = "#93a1a1",
      },
      inactive_tab_hover = {
        bg_color = "#586e75",
        fg_color = "#eee8d5",
        italic = false,
      },
      new_tab = {
        bg_color = "#657b83",
        fg_color = "#eee8d5",
      },
      new_tab_hover = {
        bg_color = "#93a1a1",
        fg_color = "#fdf6e3",
        italic = false,
      }
    },
  },
  keys = {
    {key = "[", mods = "CTRL", action=wezterm.action{ActivateTabRelative=-1}},
    {key = "]", mods = "CTRL", action=wezterm.action{ActivateTabRelative=1}},
    {key = "p", mods = "CTRL|SHIFT", action=wezterm.action{ScrollByLine=-1}},
    {key = "n", mods = "CTRL|SHIFT", action=wezterm.action{ScrollByLine=1}},
    {key = "b", mods = "CTRL|SHIFT", action=wezterm.action{ScrollByPage=-1}},
    {key = "f", mods = "CTRL|SHIFT", action=wezterm.action{ScrollByPage=1}},
  },
  exit_behavior = 'Close',
  show_tab_index_in_tab_bar = false,
  warn_about_missing_glyphs = false
}
