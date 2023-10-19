local status, ibl = pcall(require, 'ibl')
if not status then
  return
end

local indent = {
  char = '▏',
  tab_char = '>',
}
local scope = {
  enabled = false,
}

ibl.setup({
  indent = indent,
  scope = scope,
})
