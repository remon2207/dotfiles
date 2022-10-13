local status, packer = pcall(require, "packer")
if not status then
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        packer_bootstrap =
            fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    end

    vim.cmd([[packadd packer.nvim]])
    return
end

packer.startup(function(use)
    use("wbthomason/packer.nvim")

    -- ステータスラインを強化
    use({
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugins.lualine")
        end,
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
    })

    -- バッファステータス
    use({
        "akinsho/bufferline.nvim",
        branch = "main",
        config = function()
            require("plugins.bufferline")
        end,
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
    })

    -- インデントの可視化
    -- use({
    --     "lukas-reineke/indent-blankline.nvim",
    --     config = function()
    --         require("plugins.indent-blankline")
    --     end,
    -- })

    -- カラースキーム
    -- use("joshdick/onedark.vim")
    -- use({
    -- 	"lifepillar/vim-solarized8",
    -- 	config = function()
    -- 		require("plugins.vim-solarized8")
    -- 	end,
    -- })
    use({
        "svrana/neosolarized.nvim",
        config = function()
            require("plugins.neosolarized")
        end,
        requires = {
            "tjdevries/colorbuddy.nvim",
            config = function()
                require("plugins.neosolarized")
            end,
        },
    })
    -- use("cocopon/iceberg.vim")
    -- use({
    -- 	"morhetz/gruvbox",
    -- 	config = function()
    -- 		require("plugins.gruvbox")
    -- 	end,
    -- })
    -- use({
    -- 	"dracula/vim",
    -- 	as = "dracula",
    -- })
    -- use("arcticicestudio/nord-vim")
    -- use("EdenEast/nightfox.nvim")
    -- use("sainnhe/gruvbox-material")
    -- use("projekt0n/github-nvim-theme")

    -- 'ヘルプの日本語化
    use("vim-jp/vimdoc-ja")

    -- '選択範囲をGoogle翻訳
    use("skanehira/translate.vim")

    -- 'ノーマルモードでコメントアウト
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("plugins.Comment")
        end,
    })

    -- シンタックスハイライト
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("plugins.nvim-treesitter")
        end,
    })
    -- use({
    --     "nvim-treesitter/nvim-treesitter-textobjects"
    -- })

    -- hex codeを視覚的にに表示
    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("plugins.nvim-colorizer")
        end,
    })

    -- スニペット
    -- use {
    --     'SirVer/ultisnips',
    --     config = function() require('plugins.ultisnips') end
    -- }
    use({
        "L3MON4D3/LuaSnip",
        config = function()
            require("plugins.LuaSnip")
        end,
    })

    -- 引用符
    -- use("tpope/vim-surround")
    use({
        "kylechui/nvim-surround",
        config = function()
            require("plugins.nvim-surround")
        end
    })

    -- ファイル検索
    use({
        "nvim-telescope/telescope.nvim",
        config = function()
            require("plugins.telescope")
        end,
        requires = {
            {
                "nvim-lua/plenary.nvim",
            },
            {
                "kyazdani42/nvim-web-devicons",
            },
        },
    })
    use("nvim-telescope/telescope-file-browser.nvim")

    -- ジャンプ
    use({
        "phaazon/hop.nvim",
        config = function()
            require("plugins.hop")
        end,
    })

    -- ブラケット自動補完
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("plugins.nvim-autopairs")
        end,
    })

    -- ファイラー
    -- use {
    --     'kyazdani42/nvim-tree.lua',
    --     config = function() require('plugins.nvim-tree') end,
    --     requires = {
    --         'kyazdani42/nvim-web-devicons',
    --     },
    -- }

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.nvim-lspconfig")
        end,
    })
    -- use {
    --     'williamboman/nvim-lsp-installer',
    --     config = function() require('plugins/nvim-lspconfig') end
    -- }
    use({
        "williamboman/mason.nvim",
        config = function()
            require("plugins.mason")
        end,
    })
    use({
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("plugins.nvim-lspconfig")
        end,
    })

    -- 補完
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.nvim-cmp")
        end,
    })
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("saadparwaiz1/cmp_luasnip")
    use("petertriho/cmp-git")
    -- use 'quangnguyen30192/cmp-nvim-ultisnips'

    -- 関数の引数を入力しているときにシグネチャヘルプを表示
    use({
        "ray-x/lsp_signature.nvim",
        config = function()
            require("plugins.lsp_signature")
        end,
    })

    -- 不足のカラースキームを追加
    use({
        "folke/lsp-colors.nvim",
        config = function()
            require("plugins.lsp-colors")
        end,
    })
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        -- commit = "04e8167740c66193686ea3d14b511c7b160ea755",
        -- branch = 'version_2.2',
        config = function()
            require("plugins.lspsaga")
        end,
    })
    use({
        "onsails/lspkind.nvim",
        config = function()
            require("plugins.lspkind")
        end,
    })
    -- use({
    --     "SmiteshP/nvim-navic",
    --     config = function()
    --         require("plugins.nvim-lspconfig")
    --     end
    -- })

    -- フォーマッター
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
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("plugins.null-ls")
        end,
    })

    use({
        "windwp/nvim-ts-autotag",
        -- config = function() require('plugins/nvim-ts-autotag') end
    })
    -- use {
    --     'alvan/vim-closetag',
    --     config = function() require('plugins/vim-closetag') end
    -- }

    -- フローティングターミナル
    use({
        "akinsho/toggleterm.nvim",
        config = function()
            require("plugins.toggleterm")
        end,
    })

    -- git
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plugins.gitsigns")
        end,
    })

    -- markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })
    use("simeji/winresizer")

    use({
        "folke/which-key.nvim",
        config = function()
            require("plugins.which-key")
        end,
    })
    use({
        "j-hui/fidget.nvim",
        config = function()
            require("plugins.fidget")
        end
    })
    use({
        "rcarriga/nvim-notify",
        config = function()
            require("plugins.nvim-notify")
        end
    })
    use({
        "famiu/bufdelete.nvim"
    })

    if packer_bootstrap then
        packer.sync()
    end
end)
