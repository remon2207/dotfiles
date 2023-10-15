local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  install = {
    colorscheme = { 'base16-solarized-dark' }
  },
  ui = {
    border = 'rounded'
  }
}

require('lazy').setup({
  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins.lualine')
    end,
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },

  -- Buffer status
  {
    'akinsho/bufferline.nvim',
    branch = 'main',
    config = function()
      require('plugins.bufferline')
    end,
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },

  -- -- Indent Guide
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('plugins.indent-blankline')
    end,
  },

  -- Color Scheme
  {
    'RRethy/nvim-base16',
    lazy = false,
    priority = 1000,
    config = function ()
      vim.cmd([[colorscheme base16-solarized-dark]])
    end
  },

  -- Help to Japanese
  -- 'vim-jp/vimdoc-ja',

  -- Comment out in normal mode
  {
    'numToStr/Comment.nvim',
    config = function()
      require('plugins.Comment')
    end,
  },
  'JoosepAlviste/nvim-ts-context-commentstring',

  -- Syntax highlight
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    priority = 1000,
    config = function()
      require('plugins.nvim-treesitter')
    end,
  },
  'yioneko/nvim-yati',

  -- Hex color code
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('plugins.nvim-colorizer')
    end,
  },

  -- snippet
  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('plugins.LuaSnip')
    end,
  },

  -- 引用符
  {
    'kylechui/nvim-surround',
    config = function()
      require('plugins.nvim-surround')
    end,
  },

  -- fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('plugins.telescope')
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
    },
  },

  -- Jump
  {
    'phaazon/hop.nvim',
    config = function()
      require('plugins.hop')
    end,
  },

  -- Bracket autocompletion
  {
    'windwp/nvim-autopairs',
    config = function()
      require('plugins.nvim-autopairs')
    end,
  },

  -- Filer
  {
    'nvim-neo-tree/neo-tree.nvim',
    config = function()
      require('plugins.neo-tree')
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.nvim-lspconfig')
    end,
  },
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.nvim-cmp')
    end,
  },
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip',
  'petertriho/cmp-git',

  {
    'folke/lsp-colors.nvim',
    config = function()
      require('plugins.lsp-colors')
    end,
  },

  {
    'kkharji/lspsaga.nvim',
    config = function()
      require('plugins.lspsaga')
    end,
  },

  -- autotag for typescript react
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('plugins/nvim-ts-autotag')
    end,
  },

  -- Floating Terminal
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('plugins.toggleterm')
    end,
  },

  -- Git
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins.gitsigns')
    end,
  },

  -- Markdown
  {
    'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },

  -- Window resize
  {
    'simeji/winresizer',
    config = function()
      require('plugins.winresizer')
    end,
  },

  {
    'folke/which-key.nvim',
    config = function()
      require('plugins.which-key')
    end,
  },

  'famiu/bufdelete.nvim',

  -- emmet for HTML
  'mattn/emmet-vim',

  {
    'mhartington/formatter.nvim',
    config = function()
      require('plugins.formatter')
    end,
  },
  -- {
  --   'mfussenegger/nvim-lint',
  --   config = function()
  --     require('plugins.lint')
  --   end,
  -- },

  -- {
  --   'xiyaowong/nvim-transparent',
  --   config = function()
  --     require('plugins.nvim-transparent')
  --   end,
  -- },
}, opts)
