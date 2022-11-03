local status, db = pcall(require, 'dashboard')
if not status then
  return
end
local home = os.getenv('HOME')

db.custom_center = {
  {
    icon = '  ',
    desc = 'Find recent files                       ',
    action = 'Telescope oldfiles',
    shortcut = 'SPC f r',
  },
  {
    icon = '  ',
    desc = 'Find files                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = 'SPC f f',
  },
  {
    icon = '  ',
    desc = 'File browser                            ',
    action = 'Telescope file_browser',
    shortcut = 'SPC f b',
  },
  {
    icon = '  ',
    desc = 'Find word                               ',
    action = 'Telescope live_grep',
    shortcut = 'SPC f w',
  },
  {
    icon = '  ',
    desc = 'Load new theme                          ',
    action = 'Telescope colorscheme',
    shortcut = 'SPC h t',
  },
}
