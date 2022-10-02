local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'
    use {
        'nathom/filetype.nvim',
        config = function() require('plugins/filetype') end
    }

    -- ステータスラインを強化
    use {
        'nvim-lualine/lualine.nvim',
        opt = true,
        event = { 'VimEnter' },
        config = function() require('plugins/lualine') end,
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
    }

    -- バッファステータス
    use {
        'akinsho/bufferline.nvim',
        branch = 'main',
        opt = true,
        event = { 'VimEnter' },
        config = function() require('plugins/bufferline') end,
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
    }

    -- インデントの可視化
    use {
        'lukas-reineke/indent-blankline.nvim',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/indent-blankline') end
    }

    -- カラースキーム
    use {
        'joshdick/onedark.vim',
        opt = true,
        event = { 'ColorSchemePre' }
    }
    use {
        'lifepillar/vim-solarized8',
        opt = true,
        event = { 'ColorSchemePre' },
        config = function() require('plugins/vim-solarized8') end
    }
    use {
        'cocopon/iceberg.vim',
        opt = true,
        event = { 'ColorSchemePre' }
    }
    use {
        'morhetz/gruvbox',
        opt = true,
        event = { 'ColorSchemePre' },
        config = function() require('plugins/gruvbox') end
    }
    use {
        'dracula/vim',
        opt = true,
        event = { 'ColorSchemePre' },
        as = 'dracula'
    }
    use {
        'arcticicestudio/nord-vim',
        opt = true,
        event = { 'ColorSchemePre' }
    }
    use {
        'EdenEast/nightfox.nvim',
        opt = true,
        event = { 'ColorSchemePre' }
    }
    use {
        'sainnhe/gruvbox-material',
        opt = true,
        event = { 'ColorSchemePre' }
    }
    use {
        'projekt0n/github-nvim-theme',
        opt = true,
        event = { 'ColorSchemePre' }
    }

    -- 'ヘルプの日本語化
    use {
        'vim-jp/vimdoc-ja',
        opt = true,
        event = { 'BufNewFile', 'BufRead' }
    }

    -- '選択範囲をGoogle翻訳
    use {
        'skanehira/translate.vim',
        opt = true,
        cmd = { 'Translate' }
    }

    -- 'ノーマルモードでコメントアウト
    use {
        'numToStr/Comment.nvim',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/Comment') end
    }

    -- シンタックスハイライト
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/nvim-treesitter') end
    }

    -- hex codeを視覚的にに表示
    use {
        'norcalli/nvim-colorizer.lua',
        ft = { 'javascriptreact', 'typescriptreact', 'css', 'html' },
        config = function() require('plugins/nvim-colorizer') end
    }

    -- スニペット
    -- use {
    --     'SirVer/ultisnips',
    --     opt = true,
    --     event = { 'InsertEnter' },
    --     config = function() require('plugins/ultisnips') end
    -- }
    use {
        'L3MON4D3/LuaSnip',
        opt = true,
        event = { 'InsertEnter' },
        config = function() require('plugins/LuaSnip') end
    }

    -- 引用符
    use {
        'tpope/vim-surround',
        opt = true,
        event = {'BufNewFile', 'BufRead'}
    }

    -- ファイル検索
    use {
        'nvim-telescope/telescope.nvim',
        config = function() require('plugins/telescope') end,
        requires = {
            {
                'nvim-lua/plenary.nvim',
            },
            {
                'kyazdani42/nvim-web-devicons',
            }
        },
    }

    -- ジャンプ
    use {
        'phaazon/hop.nvim',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/hop') end
    }

    -- ブラケット自動補完
    use {
        'windwp/nvim-autopairs',
        opt = true,
        event = { 'InsertEnter' },
        config = function() require('plugins/nvim-autopairs') end
    }

    -- ウィンドウリサイズ
    -- use {
    --     'simeji/winresized',
    --     opt = true,
    --     cmd = { 'WinResizerStartResize' }
    -- }

    -- ファイラー
    use {
        'kyazdani42/nvim-tree.lua',
        opt = true,
        event = { 'VimEnter' },
        config = function() require('plugins/nvim-tree') end,
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        config = function() require('plugins/nvim-lspconfig') end
    }
    use {
        'williamboman/nvim-lsp-installer',
        config = function() require('plugins/nvim-lspconfig') end
    }

    -- 補完
    use {
        'hrsh7th/nvim-cmp',
        config = function() require('plugins/nvim-cmp') end
    }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    -- use 'quangnguyen30192/cmp-nvim-ultisnips'

    -- 関数の引数を入力しているときにシグネチャヘルプを表示
    use {
        'ray-x/lsp_signature.nvim',
        config = function() require('plugins/lsp_signature') end,
    }

    -- 不足のカラースキームを追加
    use {
        'folke/lsp-colors.nvim',
        config = function() require('plugins/lsp-colors') end,
        opt = true,
        event = { 'BufNewFile', 'BufRead' }
    }
    use {
        'glepnir/lspsaga.nvim',
        -- branch = 'main',
        branch = 'version_2.2',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/lspsaga') end
    }

    -- フォーマッター
    use {
        'prettier/vim-prettier',
        run = 'npm install --omit=dev',
        ft = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html' },
        config = function() require('plugins/vim-prettier') end
    }

    use {
        'windwp/nvim-ts-autotag',
        ft = {'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'xml', 'php', 'markdown', 'glimmer','handlebars','hbs'},
        -- config = function() require('plugins/nvim-ts-autotag') end
    }
    -- use {
    --     'alvan/vim-closetag',
    --     config = function() require('plugins/vim-closetag') end
    -- }

    -- フローティングターミナル
    use {
        'akinsho/toggleterm.nvim',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/toggleterm') end
    }

    -- git
    use {
        'lewis6991/gitsigns.nvim',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/gitsigns') end
    }

    -- use {
    --     'tversteeg/registers.nvim',
    --     opt = true,
    --     event = { 'InsertEnter' }
    -- }
    -- キーマップ一覧を表示
    -- use {
    --     'folke/which-key.nvim',
    --     opt = true,
    --     event = { 'BufNewFile', 'BufRead' },
    --     config = function() require('plugins/which-key') end
    -- }
    -- use {
    --     'jason0x43/vim-js-indent',
    --     config = function() require('plugins/vim-js-indent') end
    -- }
    -- use 'HerringtonDarkholme/yats.vim'
    -- use 'leafgarland/typescript-vim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
