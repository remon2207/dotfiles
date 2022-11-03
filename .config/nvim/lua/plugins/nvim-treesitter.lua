local status, t = pcall(require, 'nvim-treesitter.configs')
if not status then
  return
end

t.setup({
  highlight = {
    enable = true,
  },
  -- indent = {
  --   enable = true,
  --   disable = {
  --     'typescript',
  --     'graphql',
  --   },
  -- },
  yati = {
    enable = true,
  },
  indent = {
    enable = false, -- disable builtin indent module
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      javascript = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s',
      },
      typescript = {
        __default = '// %s',
        tsx_element = '{/* %s */}',
        tsx_fragment = '{/* %s */}',
        tsx_attribute = '// %s',
        comment = '// %s',
      },
    },
  },
  ensure_installed = {
    'javascript',
    'bash',
    'css',
    'scss',
    'dockerfile',
    'lua',
    'html',
    'json',
    'jsonc',
    'markdown',
    'php',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'yaml',
    'gitignore',
    'sql',
    'graphql',
    'prisma',
    'fish',
  },
})
