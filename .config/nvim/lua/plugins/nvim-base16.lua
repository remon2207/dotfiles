local status, base16 = pcall(require, "base16-solarized-dark")
if not status then
    return
end

base16.setup()
