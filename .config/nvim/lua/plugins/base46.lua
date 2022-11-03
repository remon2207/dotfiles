local status, base46 = pcall(require, 'base46')

if not status then
  return
end

base46.load_theme()
