require('bufferline').setup {
    options = {
        -- numbers = 'buffer_id',
        -- number_style = nil,
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = 'thick'
    },
    highlights = {
        buffer_selected = {
            gui = 'bold'
        },
        diagnostic_selected = {
            gui = 'bold'
        },
        info_selected = {
            gui = 'bold'
        },
        info_diagnostic_selected = {
            gui = 'bold'
        },
        warning_selected = {
            gui = 'bold'
        },
        warning_diagnostic_selected = {
            gui = 'bold'
        },
        error_selected = {
            gui = 'bold'
        },
        error_diagnostic_selected = {
            gui = 'bold'
        },
        duplicate_selected = {
            gui = nil
        },
        duplicate_visible = {
            gui = nil
        },
        duplicate = {
            gui = nil
        },
        pick_selected = {
            gui = 'bold'
        },
        pick_visible = {
            gui = 'bold'
        },
        pick = {
            gui = 'bold'
        }
    }
}
