-- Packer at first lunch of nvim:
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'tpope/vim-fugitive'

    use 'ThePrimeagen/harpoon'

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    use {'nvim-tree/nvim-web-devicons'}

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {'nvim-treesitter/playground'}

    use {'nvim-lua/plenary.nvim'}

    use {'mbbill/undotree'}

    use {'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'}

    use {'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'}}
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    use {
        'windwp/nvim-autopairs',
    }

    use {'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim'}

    use {'CRAG666/betterTerm.nvim'}

    use {'yamatsum/nvim-cursorline'}

    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
                -- config
                theme = 'hyper',
                config = {
                    week_header = {
                        enable = true,
                    },
                },
            }


        end,
        requires = {'nvim-tree/nvim-web-devicons'}
    }

    use 'mfussenegger/nvim-dap'

    use {'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }

    use 'theHamsta/nvim-dap-virtual-text'

    use {'folke/neodev.nvim'}

    use {'ms-jpq/chadtree',
        {branch = 'chad', run = 'python3 -m chadtree deps',
            alias = 'chadtree'}
    }

    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        }
    }

    use 'lervag/vimtex'

    use 'sickill/vim-monokai'

    use 'https://github.com/adelarsq/vim-devicons-emoji'

    use 'ryanoasis/vim-devicons'

    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use "jose-elias-alvarez/null-ls.nvim"
    use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {
    }
  end
}
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

