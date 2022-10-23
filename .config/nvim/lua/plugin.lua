local status, packer = pcall(require, 'packer')
if not status then
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        packer_bootstrap =
            fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    end

    vim.cmd([[packadd packer.nvim]])
    return
end

packer.startup({
    function(use)
        use('wbthomason/packer.nvim')

        -- Status line
        use({
            'nvim-lualine/lualine.nvim',
            config = function()
                require('plugins.lualine')
            end,
            requires = {
                'kyazdani42/nvim-web-devicons',
            },
        })

        -- Buffer status
        use({
            'akinsho/bufferline.nvim',
            branch = 'main',
            config = function()
                require('plugins.bufferline')
            end,
            requires = {
                'kyazdani42/nvim-web-devicons',
            },
        })

        -- Indent Guide
        use({
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require('plugins.indent-blankline')
            end,
        })

        -- Colorscheme
        -- use({
        --     'svrana/neosolarized.nvim',
        --     config = function()
        --         require('plugins.neosolarized')
        --     end,
        --     requires = {
        --         'tjdevries/colorbuddy.nvim',
        --     },
        -- })
        -- use('ishan9299/nvim-solarized-lua')
        -- use('lifepillar/vim-solarized8')
        -- use('RRethy/nvim-base16')

        use({
            'echasnovski/mini.nvim',
            config = function() require('plugins.mini') end
        })

        -- Help to Japanese
        use('vim-jp/vimdoc-ja')

        -- DeepL translater
        use('vim-denops/denops.vim')
        use('skanehira/denops-translate.vim')

        -- Comment out in normal mode
        use({
            'numToStr/Comment.nvim',
            config = function()
                require('plugins.Comment')
            end,
        })
        use({
            'JoosepAlviste/nvim-ts-context-commentstring'
        })

        -- Syntax highlight
        use({
            'nvim-treesitter/nvim-treesitter',
            commit = '4cccb6f494eb255b32a290d37c35ca12584c74d0',
            run = ':TSUpdate',
            config = function()
                require('plugins.nvim-treesitter')
            end,
        })

        -- Hex color code
        use({
            'norcalli/nvim-colorizer.lua',
            config = function()
                require('plugins.nvim-colorizer')
            end,
        })

        -- snippet
        use({
            'L3MON4D3/LuaSnip',
            config = function()
                require('plugins.LuaSnip')
            end,
        })

        -- 引用符
        use({
            'kylechui/nvim-surround',
            config = function()
                require('plugins.nvim-surround')
            end,
        })

        -- fuzzy finder
        use({
            'nvim-telescope/telescope.nvim',
            config = function()
                require('plugins.telescope')
            end,
            requires = {
                {
                    'nvim-lua/plenary.nvim',
                },
                {
                    'kyazdani42/nvim-web-devicons',
                },
            },
        })
        use('nvim-telescope/telescope-file-browser.nvim')

        -- jump
        use({
            'phaazon/hop.nvim',
            config = function()
                require('plugins.hop')
            end,
        })

        -- bracket autocompletion
        use({
            'windwp/nvim-autopairs',
            config = function()
                require('plugins.nvim-autopairs')
            end,
        })

        -- filer
        -- use({
        --     'kyazdani42/nvim-tree.lua',
        --     config = function()
        --         require('plugins.nvim-tree')
        --     end,
        --     requires = {
        --         'kyazdani42/nvim-web-devicons',
        --     },
        -- })
        -- use({
        --     'nvim-neo-tree/neo-tree.nvim',
        --     -- branch = 'v2.x',
        --     requires = {
        --         'nvim-lua/plenary.nvim',
        --         'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
        --         'MunifTanjim/nui.nvim',
        --     },
        -- })

        -- LSP
        use({
            'neovim/nvim-lspconfig',
            config = function()
                require('plugins.nvim-lspconfig')
            end,
        })
        -- use {
        --     'williamboman/nvim-lsp-installer',
        --     config = function() require('plugins/nvim-lspconfig') end
        -- }
        use({
            'williamboman/mason.nvim',
            config = function()
                require('plugins.nvim-lspconfig')
            end,
        })
        use({
            'williamboman/mason-lspconfig.nvim',
            config = function()
                require('plugins.nvim-lspconfig')
            end,
        })

        -- completion
        use({
            'hrsh7th/nvim-cmp',
            config = function()
                require('plugins.nvim-cmp')
            end,
        })
        use('hrsh7th/cmp-nvim-lsp')
        use('hrsh7th/cmp-buffer')
        use('hrsh7th/cmp-path')
        use('hrsh7th/cmp-cmdline')
        use('saadparwaiz1/cmp_luasnip')
        use('petertriho/cmp-git')
        -- use 'quangnguyen30192/cmp-nvim-ultisnips'

        -- Show signature help in insert mode
        use({
            'ray-x/lsp_signature.nvim',
            config = function()
                require('plugins.lsp_signature')
            end,
        })
        -- DAP
        -- use({
        --     'mfussenegger/nvim-dap',
        --     config = function()
        --         require('plugins.nvim-dap')
        --     end,
        -- })
        -- use({
        --     'rcarriga/nvim-dap-ui',
        --     config = function()
        --         require('plugins.nvim-dap-ui')
        --     end,
        -- })

        -- Add missing colors
        use({
            'folke/lsp-colors.nvim',
            config = function()
                require('plugins.lsp-colors')
            end,
        })

        -- Stylish UI
        -- use({
        --     'glepnir/lspsaga.nvim',
        --     branch = 'main',
        --     -- commit = "04e8167740c66193686ea3d14b511c7b160ea755",
        --     -- branch = 'version_2.2',
        --     config = function()
        --         require('plugins.lspsaga')
        --     end,
        -- })

        use({
            'onsails/lspkind.nvim',
            config = function()
                require('plugins.lspkind')
            end,
        })
        -- use({
        --     "SmiteshP/nvim-navic",
        --     config = function()
        --         require("plugins.nvim-lspconfig")
        --     end
        -- })

        -- Formatter
        -- use {
        --     'prettier/vim-prettier',
        --     run = 'npm install --omit=dev',
        --     config = function() require('plugins.vim-prettier') end
        -- }
        -- use {
        --     'mhartington/formatter.nvim',
        --     config = function() require('plugins.formatter') end
        -- }
        use({
            'jose-elias-alvarez/null-ls.nvim',
            config = function()
                require('plugins.null-ls')
            end,
        })

        use({
            'windwp/nvim-ts-autotag',
            config = function()
                require('plugins/nvim-ts-autotag')
            end,
        })
        -- use {
        --     'alvan/vim-closetag',
        --     config = function() require('plugins/vim-closetag') end
        -- }

        -- Floating Terminal
        -- use({
        --     'akinsho/toggleterm.nvim',
        --     config = function()
        --         require('plugins.toggleterm')
        --     end,
        -- })

        -- Git
        use({
            'lewis6991/gitsigns.nvim',
            config = function()
                require('plugins.gitsigns')
            end,
        })

        -- Markdown
        use({
            'iamcco/markdown-preview.nvim',
            run = function()
                vim.fn['mkdp#util#install']()
            end,
        })

        -- Window resize
        use({
            'simeji/winresizer',
            config = function()
                require('plugins.winresizer')
            end,
        })

        use({
            'folke/which-key.nvim',
            config = function()
                require('plugins.which-key')
            end,
        })
        -- Notify ui
        use({
            'j-hui/fidget.nvim',
            config = function()
                require('plugins.fidget')
            end,
        })

        use({
            'famiu/bufdelete.nvim',
        })

        -- emmet for HTML
        use('mattn/emmet-vim')

        if packer_bootstrap then
            packer.sync()
        end
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})
