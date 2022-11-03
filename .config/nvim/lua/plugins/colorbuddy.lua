local status, colorbuddy = pcall(require, 'colorbuddy')
if not status then
  return
end

colorbuddy.setup()
