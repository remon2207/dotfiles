local status, colorizer = pcall(require, 'colorizer')
if not status then
  return
end

colorizer.setup({
  'css',
  'javascriptreact',
  'typescriptreact',
  'html',
  'lua',
  'vim',
  -- html = {
  --     mode = "foreground",
  -- },
})
