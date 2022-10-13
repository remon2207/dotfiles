local status, notify = pcall(require, "notify")
if not status then
    return
end

vim.notify("This is an error message", "error")
