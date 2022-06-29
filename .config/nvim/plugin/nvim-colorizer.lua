local status, colorizer = pcall(require, 'colorizer')

if (not status) then return end

colorizer.setup {}

vim.cmd[[autocmd BufNewFile,BufRead * ColorizerAttachToBuffer]]
