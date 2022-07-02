local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- use 'lewis6991/impatient.nvim'

    -- use {
    --     'nathom/filetype.nvim',
    --     config = function() require('plugins/filetype') end
    -- }

    -- ステータスラインを強化
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function() require('plugins/lualine') end
    }

    -- バッファステータス
    use {
        'akinsho/bufferline.nvim',
        branch = 'main',
        requires = {'kyazdani42/nvim-web-devicons' },
        config = function() require('plugins/bufferline') end
    }

    -- インデントの可視化
    use {
        'lukas-reineke/indent-blankline.nvim',
        opt = true,
        event = {'BufNewFile', 'BufRead' },
        config = function() require('plugins/indent-blankline') end
    }

    -- カラースキーム
    use {
        'arcticicestudio/nord-vim',
        -- opt = true,
        -- event = { 'ColorSchemePre' }
    }
    use {
        'EdenEast/nightfox.nvim',
        -- opt = true,
        -- event = { 'ColorSchemePre' }
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
        'tpope/vim-commentary',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
    }

    -- シンタックスハイライト
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        opt = true,
        event = {'BufNewFile', 'BufRead'},
        config = function() require('plugins/nvim-treesitter') end
    }

    -- hex codeを自覚的に表示
    use {
        'norcalli/nvim-colorizer.lua',
        ft = { 'javascriptreact', 'typescriptreact', 'css', 'html' }
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
        event = { 'BufEnter' },
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'kyazdani42/nvim-web-devicons' }
        },
        config = function() require('plugins/telescope') end
    }

    -- 高速移動
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
    use {
        'simeji/winresizer',
        opt = true,
        event = { 'WinNew' }
    }

    -- ファイラー
    -- use {
    --     'kyazdani42/nvim-tree.lua',
    --     opt = true,
    --     event = { 'BufNewFile', 'BufRead' },
    --     requires = {'kyazdani42/nvim-web-devicons' },
    --     config = function() require('plugins/nvim-tree') end
    -- }
    use {
        'lambdalisue/fern.vim',
        config = function() require('plugins/fern') end
    }
    use {
        'lambdalisue/glyph-palette.vim',
        config = function() require('plugins/glyph-palette') end
    }
    use {
        'lambdalisue/fern-renderer-nerdfont.vim',
        requires = {
            { 'lambdalisue/nerdfont.vim' },
            { 'lambdalisue/fern.vim' }
        },
        config = function() require('plugins/fern') end
    }
    use {
        'lambdalisue/fern-git-status.vim',
    }
    use {
        'yuki-yano/fern-preview.vim',
        config = function() require('plugins/fern') end
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
        'hrsh7th/cmp-nvim-lsp',
    }
    use {
        'quangnguyen30192/cmp-nvim-ultisnips',
    }

    -- 関数の引数を入力しているときにシグネチャヘルプを表示
    use {
        'ray-x/lsp_signature.nvim',
        config = function() require('plugins/lsp_signature') end
    }

    -- 不足のカラースキームを追加
    use {
        'folke/lsp-colors.nvim',
        opt = true,
        event = {'BufNewFile', 'BufRead'},
        config = function() require('plugins/lsp-colors') end
    }

    -- 非同期
    -- use {
    --     'dense-analysis/ale',
    --     opt = true,
    --     event = {'BufNewFile', 'BufRead'},
    --     config = function() require('plugins/ale') end
    -- }

    -- フォーマッター
    use {
        'prettier/vim-prettier',
        run = 'npm install --omit=dev',
        ft = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html' },
        config = function() require('plugins/vim-prettier') end
    }

    -- use {
    --     'kosayoda/nvim-lightbulb',
    --     opt = true,
    --     event = {'BufNewFile', 'BufRead'},
    --     requires = { { 'antoinemadec/FixCursorHold.nvim', config = function() require('plugins/FixCursorHold') end } },
    --     config = function() require('plugins/nvim-lightbulb') end
    -- }
    use {
        'antoinemadec/FixCursorHold.nvim',
        config = function() require('plugins/FixCursorHold') end
    }

    use {
        'glepnir/lspsaga.nvim',
        branch = 'main',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/lspsaga') end
    }
    use {
        'folke/trouble.nvim',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/trouble') end
    }

    use {
        'windwp/nvim-ts-autotag',
        ft = {'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'xml', 'php', 'markdown', 'glimmer','handlebars','hbs'},
    }

    -- フローティングターミナル
    use {
        'voldikss/vim-floaterm',
        opt = true,
        event = { 'BufNewFile', 'Bufread' },
        config = function() require('plugins/vim-floaterm') end
    }
    -- キーバインド
    use {
        'folke/which-key.nvim',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/which-key') end
    }
    use {
        'j-hui/fidget.nvim',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/fidget') end
    }
    -- git
    use {
        'lewis6991/gitsigns.nvim',
        opt = true,
        event = { 'BufNewFile', 'BufRead' },
        config = function() require('plugins/gitsigns') end
    }
    use {
        'TimUntersberger/neogit',
        opt = true,
        event = { 'BufEnter' },
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function() require('plugins/neogit') end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
