local wezterm = require('wezterm')

return {
    font = wezterm.font_with_fallback({
        'Hack Nerd Font',
        'HackGen',
        'monospace',
    }),
    font_size = 12.0,
    color_scheme = 'Builtin Solarized Dark',
    window_background_opacity = 0.9,
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
        { key = 'p', mods = 'CTRL|SHIFT', action = wezterm.action({ ScrollByLine = -1 }) },
        { key = 'n', mods = 'CTRL|SHIFT', action = wezterm.action({ ScrollByLine = 1 }) },
        { key = 'b', mods = 'CTRL|SHIFT', action = wezterm.action({ ScrollByPage = -1 }) },
        { key = 'f', mods = 'CTRL|SHIFT', action = wezterm.action({ ScrollByPage = 1 }) },
        { key = '?', mods = 'CTRL|SHIFT', action = wezterm.action({ Search = { CaseSensitiveString = '' } }) },
        { key = 'PageUp', mods = 'CTRL|SHIFT', action = wezterm.action({ MoveTabRelative = -1 }) },
        { key = 'PageDown', mods = 'CTRL|SHIFT', action = wezterm.action({ MoveTabRelative = 1 }) },
    },
    -- disable_default_key_bindings = true,
    -- exit_behavior = 'Close',
    warn_about_missing_glyphs = false,
}
