local status, filetype = pcall(require, 'filetype')
if not status then
  return
end

filetype.setup({
  overrides = {
    extensions = {
      -- 		js = "javascript",
      -- 		jsx = "javascriptreact",
      -- 		ts = "typescript",
      -- 		tsx = "typescriptreact",
      -- 		lua = "lua",
      -- 		vim = "vim",
      -- 		snippets = "snippets",
      -- service = "systemd",
      -- prisma = "prisma"
    },
    complex = {
      -- ["*.json"] = "json",
      ['/tsconfig.json'] = 'jsonc',
      ['/jsconfig.json'] = 'jsonc',
      ['**/i3/config'] = 'i3config',
      ['/.env*'] = 'sh',
    },
  },
})
