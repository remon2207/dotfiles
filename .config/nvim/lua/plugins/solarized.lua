local status, solarized = pcall(require, 'solarized')
if not status then
  return
end

solarized.set()
