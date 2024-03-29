local status, bufferline = pcall(require, 'bufferline')
if not status then
  return
end

local options = {
  show_buffer_close_icons = false,
  show_close_icon = false,
  separator_style = 'slant',
  diagnostics = 'nvim_lsp',
}

local highlights = {
  buffer_selected = {
    underline = false,
    undercurl = false,
    italic = false,
  },
  diagnostic_selected = {
    underline = false,
    undercurl = false,
    italic = false,
  },
  info_selected = {
    underline = false,
    undercurl = false,
    italic = false,
  },
  info_diagnostic_selected = {
    underline = false,
    undercurl = false,
    italic = false,
  },
  warning_selected = {
    underline = false,
    undercurl = false,
    italic = false,
  },
  warning_diagnostic_selected = {
    underline = false,
    undercurl = false,
    italic = false,
  },
  error_selected = {
    underline = false,
    undercurl = false,
    italic = false,
  },
  error_diagnostic_selected = {
    underline = false,
    undercurl = false,
    italic = false,
  },
  duplicate_selected = {
    underline = false,
    undercurl = false,
    italic = false,
  },
  duplicate_visible = {
    underline = false,
    undercurl = false,
    italic = false,
  },
  duplicate = {
    underline = false,
    undercurl = false,
    italic = false,
  },
  pick_selected = {
    underline = false,
    undercurl = false,
    italic = false,
  },
  pick_visible = {
    underline = false,
    undercurl = false,
    italic = false,
  },
  pick = {
    underline = false,
    undercurl = false,
    italic = false,
  },
}

bufferline.setup({
  options = options,
  highlights = highlights,
})
