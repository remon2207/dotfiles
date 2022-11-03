local status, dap = pcall(require, 'dap')
if not status then
  return
end

dap.adapters.chrome = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/ghq/github.com/Microsoft/vscode-chrome-debug/out/src/chromeDebug.js' }, -- TODO adjust
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
  {
    type = 'chrome',
    request = 'attach',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    port = 9222,
    webRoot = '${workspaceFolder}',
  },
}

dap.configurations.typescriptreact = { -- change to typescript if needed
  {
    type = 'chrome',
    request = 'attach',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    port = 9222,
    url = 'http://localhost:3000',
    webRoot = '${workspaceFolder}',
  },
}
