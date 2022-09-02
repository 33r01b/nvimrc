-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`

return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- closes brackets
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- comments
    use 'tpope/vim-commentary'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- docker lsp server
    use 'rcjsuen/dockerfile-language-server-nodejs'
    
    -- completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            'f3fora/cmp-spell',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-path',
            'octaltree/cmp-look',
        }
    }

    use {
        'hrsh7th/cmp-vsnip',
        after = 'nvim-cmp',
        requires = {
            'hrsh7th/vim-vsnip',
            {
                'rafamadriz/friendly-snippets',
                after = 'cmp-vsnip'
            }
        }
    }

    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }

    -- git
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup()
        end
    }

    -- easy motion
    use {
        'phaazon/hop.nvim',
        branch = 'v1', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    -- highlights 
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-refactor'

    -- filebrowser
    use 'kyazdani42/nvim-tree.lua'

    -- terminal
    use 'voldikss/vim-floaterm'

    -- theme
    use({
        "catppuccin/nvim",
        as = "catppuccin"
    })

    -- statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- markdown preview
    use {"ellisonleao/glow.nvim"}

    -- ASCII diagrams
    use "jbyuki/venn.nvim"
end)
