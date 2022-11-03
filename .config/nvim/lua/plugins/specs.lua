local status, specs = pcall(require, 'specs')
if not status then
  return
end

specs.setup()
