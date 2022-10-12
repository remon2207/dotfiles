local status, op = pcall(require, "nvim-autopairs")
if not status then
    return
end

op.setup({
    enable_check_bracket_line = false,
    map_c_w = true,
    map_c_h = true,
})
