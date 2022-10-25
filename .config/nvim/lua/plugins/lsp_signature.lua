local status, signature = pcall(require, "lsp_signature")
if not status then
    return
end

signature.setup({
    -- floating_window = false,
    -- zindex = 50
    bind = true
})
