local nvim_create_user_command = vim.api.nvim_create_user_command

nvim_create_user_command('Pi', 'PackerInstall', {})
nvim_create_user_command('Pc', 'PackerClean', {})
nvim_create_user_command('Ps', 'PackerSync', {})
