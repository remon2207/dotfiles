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
    -- 'HackGenNerd Console',
    -- 'PlemolJP Console NF'
    -- 'Ricty Nerd Font'
    'RictyDiscord Nerd Font'
    -- {family='RictyDiscord Nerd Font', weight='Bold'}
    -- 'Source Han Code JP'
  }),
  font_size = 12.0,
  color_scheme = 'iceberg-dark',
  -- color_scheme = 'Solarized Dark - Patched',
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
      background = "#1e2132",
      active_tab = {
        bg_color = "#3d425b",
        fg_color = "#c6c8d1",
        intensity = "Normal",
        underline = "None",
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = "#242940",
        fg_color = "#808080",
      },
      inactive_tab_hover = {
        bg_color = "#3e445e",
        fg_color = "#c6c8d1",
        italic = false,
      },
      new_tab = {
        bg_color = "#515e97",
        fg_color = "#c6c8d1",
      },
      new_tab_hover = {
        bg_color = "#515e97",
        fg_color = "#c6c8d1",
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
