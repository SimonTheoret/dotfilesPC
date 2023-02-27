-- Packer at first lunch of nvim:
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') ..
                             '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- installing required packages:
local use = require('packer').use
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'neovim/nvim-lspconfig'

    use {'nvim-lualine/lualine.nvim'}

    use 'tpope/vim-fugitive'

    use 'ThePrimeagen/harpoon'

    use {'nvim-tree/nvim-web-devicons'}

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    use {'nvim-treesitter/playground'}

    use {'nvim-lua/plenary.nvim'}

    use {'mbbill/undotree'}

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    pcall(require("telescope").load_extension, 'fzf') -- use fzf

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'}, -- Required
            {'williamboman/mason.nvim'}, -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
            -- Autocompletion
            {'hrsh7th/nvim-cmp'}, -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'hrsh7th/cmp-buffer'}, -- Optional
            {'hrsh7th/cmp-path'}, -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'}, -- Optional
            {'hrsh7th/cmp-nvim-lsp-signature-help'},
            -- Snippets
            {'L3MON4D3/LuaSnip'}, -- Required
            {'rafamadriz/friendly-snippets'} -- Optional
        }
    }

    use {'windwp/nvim-autopairs'}

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the
        -- latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use {'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim'}

    use {'CRAG666/betterTerm.nvim'}

    use {'yamatsum/nvim-cursorline'}

    use 'mfussenegger/nvim-dap'

    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
                -- config
                theme = 'hyper',
                config = {week_header = {enable = true}}
            }
        end
    }

    use {'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'}}

    use 'theHamsta/nvim-dap-virtual-text'

    use {'folke/neodev.nvim'}

    use {'nvim-tree/nvim-tree.lua'}

    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-python", "rouge8/neotest-rust",
            "shunsambongi/neotest-testthat", "nvim-neotest/neotest-vim-test"
        } -- neotest-testthat is R adapter while vim-test is a general adapter
    }

    use 'vim-test/vim-test'

    use 'lervag/vimtex'

    use 'sickill/vim-monokai'

    use {"folke/trouble.nvim"}

    use "jose-elias-alvarez/null-ls.nvim"

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function() require("todo-comments").setup {} end
    }

    use {'tpope/vim-commentary'}

    use {'vimwiki/vimwiki'}

    use {'norcalli/nvim-colorizer.lua'}

    use {'antoinemadec/FixCursorHold.nvim'}

    use {'folke/which-key.nvim'}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then require('packer').sync() end
end)
