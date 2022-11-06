local status, registers = pcall(require, 'registers')
if not status then
  return
end

-- registers.setup({
--   window = {
--     -- The window can't be wider than 100 characters
--     max_width = 100,
--     -- Show a small highlight in the sign column for the line the cursor is on
--     -- highlight_cursorline = true,
--     -- Don't draw a border around the registers window
--     border = 'rounded',
--     -- Apply a tiny bit of transparency to the the window, letting some characters behind it bleed through
--     -- transparency = 10,
--   },
-- })

registers.setup({
  window = {
    border = 'rounded',
  },
})
-- vim.keymap.set('i', '<C-r>', '<Cmd>Registers<CR>', { noremap = true, silent = true })
