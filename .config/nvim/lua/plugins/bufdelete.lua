local status, bufdelete = pcall(require, 'bufdelete')
if not status then
    return
end
