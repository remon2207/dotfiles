local api = vim.api

api.nvim_create_user_command('Pi', 'PackerInstall', {})
api.nvim_create_user_command('Pc', 'PackerClean', {})
api.nvim_create_user_command('Ps', 'PackerSync', {})
