local status, t = pcall(require, 'nvim-treesitter.configs')
if not status then
  return
end

local ensure_installed = {
  'bash',
  'css',
  'csv',
  'dockerfile',
  'fish',
  'git_config',
  'git_rebase',
  'gitattributes',
  'gitcommit',
  'gitignore',
  'graphql',
  'hjson',
  'html',
  'ini',
  'javascript',
  'jsdoc',
  'json',
  'json5',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'prisma',
  'scss',
  'sql',
  'ssh_config',
  'toml',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
}

t.setup({
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  indent = {
    enable = false,
  },
  ensure_installed = ensure_installed,
})
