local status, notify = pcall(require, 'notify')
if not status then
    return
end

-- notify.setup({
--     render = 'minimal',
-- })

vim.notify = require('notify')
