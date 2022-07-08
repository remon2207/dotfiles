local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- 起動時間短縮
    use {
        'lewis6991/impatient.nvim'
    }
    use {
        'nathom/filetype.nvim',
        config = function() require('plugins/filetype') end
    }

    -- ステータスラインを強化
    use {
        'nvim-lualine/lualine.nvim',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/lualine') end,
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true,
            event = { 'BufNewFile', 'BufRead' }
        },
    }

    -- バッファステータス
    use {
        'akinsho/bufferline.nvim',
        branch = 'main',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/bufferline') end,
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true,
            event = { 'BufNewFile', 'BufRead' }
        },
    }

    -- インデントの可視化
    -- use {
    --     'lukas-reineke/indent-blankline.nvim',
    --     opt = true,
    --     event = { 'BufNewFile', 'BufRead' },
    --     config = function() require('plugins/indent-blankline') end
    -- }

    -- カラースキーム
    use {
        'joshdick/onedark.vim',
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
    use {
        'SirVer/ultisnips',
        opt = true,
        event = { 'InsertEnter' },
        config = function() require('plugins/ultisnips') end
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
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/telescope') end,
        requires = {
            {
                'nvim-lua/plenary.nvim',
                opt = true,
                event = { 'BufNewFile', 'BufRead' }
            },
            {
                'kyazdani42/nvim-web-devicons',
                opt = true,
                event = { 'BufNewFile', 'BufRead' }
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
    -- use {
    --     'kyazdani42/nvim-tree.lua',
    --     opt = true,
    --     event = { 'BufEnter' },
    --     config = function() require('plugins/nvim-tree') end,
    --     requires = {
    --         'kyazdani42/nvim-web-devicons',
    --         opt = true,
    --         event = { 'BufEnter' }
    --     },
    -- }
    use {
        'preservim/nerdtree',
        config = function() require('plugins/nerdtree') end,
        requires = {
            {
                'ryanoasis/vim-devicons',
            },
            {
                'Xuyuanp/nerdtree-git-plugin',
                config = function() require('plugins/nerdtree-git-plugin') end
            },
            {
                'tiagofumo/vim-nerdtree-syntax-highlight',
            }
        }
    }
    -- use {
    --     'lambdalisue/fern.vim',
    --     config = function() require('plugins/fern') end,
    --     requires = {
    --         {
    --             'lambdalisue/nerdfont.vim',
    --             opt = true,
    --             event = { 'BufNewFile', 'BufRead' }
    --         },
    --         {
    --             'lambdalisue/fern-renderer-nerdfont.vim',
    --             opt = true,
    --             event = { 'BufNewFile', 'BufRead' }
    --         },
    --         {
    --             'lambdalisue/glyph-palette.vim',
    --             opt = true,
    --             event = { 'BufNewFile', 'BufRead' },
    --             config = function() require('plugins/glyph-palette') end
    --         }
    --     }
    -- }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/nvim-lspconfig') end,
        requires = {
            {
                'williamboman/nvim-lsp-installer',
                opt = true,
                event = { 'BufNewFile', 'BufRead' },
            }
        }
    }

    -- 補完
    use {
        'hrsh7th/nvim-cmp',
        config = function() require('plugins/nvim-cmp') end,
    }
    use {
        'hrsh7th/cmp-nvim-lsp',
    }
    use {
        'hrsh7th/cmp-buffer',
    }
    use {
        'hrsh7th/cmp-path',
    }
    use {
        'hrsh7th/cmp-cmdline',
    }
    use {
        'quangnguyen30192/cmp-nvim-ultisnips',
    }
    use {
        'onsails/lspkind.nvim',
    }

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
    }

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

    use {
        'tversteeg/registers.nvim',
        opt = true,
        event = { 'InsertEnter' }
    }
    -- キーマップ一覧を表示
    use {
        'folke/which-key.nvim',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/which-key') end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
