local status, noice = pcall(require, 'noice')
if not status then
    return
end

-- local Popup = require("nui.popup")
--
-- local popup = Popup({
--   position = "50%",
--   size = {
--     width = 80,
--     height = 40,
--   },
--   enter = true,
--   focusable = true,
--   zindex = 50,
--   relative = "editor",
--   border = {
--     padding = {
--       top = 2,
--       bottom = 2,
--       left = 3,
--       right = 3,
--     },
--     style = "rounded",
--     text = {
--       top = " I am top title ",
--       top_align = "center",
--       bottom = "I am bottom title",
--       bottom_align = "left",
--     },
--   },
--   buf_options = {
--     modifiable = true,
--     readonly = false,
--   },
--   win_options = {
--     winblend = 10,
--     winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
--   },
-- })

noice.setup({
    lsp = {
        hover = {
            enabled = false,
            -- opts = {
            --     border = {
            --         padding = {
            --             top = 0,
            --             left = 0
            --         },
            --         style = 'rounded'
            --     },
            --     position = 2
            -- },
        },
        signature = {
            auto_open = {
                enabled = false,
            },
            opts = {
                border = {
                    padding = {
                        top = 0,
                        left = 0,
                    },
                    style = 'rounded',
                },
                position = 2,
            },
        },
    },
})

-- vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
--     -- config = config or {}
--     config = popup_opts
--     config.focus_id = ctx.method
--     if not (result and result.contents) then
--         -- vim.notify('No information available')
--         return
--     end
--     local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
--     markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
--     if vim.tbl_isempty(markdown_lines) then
--         -- vim.notify('No information available')
--         return
--     end
--     return vim.lsp.util.open_floating_preview(markdown_lines, 'markdown', config)
-- end

local status2, telescope = pcall(require, 'telescope')
if not status2 then
    return
end

local status3, notify = pcall(require, 'notify')
if not status3 then
    return
end

telescope.load_extension('noice')

vim.keymap.set('n', '<leader>nl', function()
    require('noice').cmd('last')
end)

vim.keymap.set('n', '<leader>nh', function()
    require('noice').cmd('history')
end)
