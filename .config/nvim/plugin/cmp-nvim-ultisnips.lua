local status, ultisnips = pcall(require, 'cmp_nvim_ultisnips')

if (not status) then return end

ultisnips.setup {}
