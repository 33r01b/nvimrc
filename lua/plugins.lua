-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use '9mm/vim-closer'

    use 'tpope/vim-commentary'

    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use  { 
        'hrsh7th/nvim-cmp',
        requires = { { 'hrsh7th/cmp-nvim-lsp' } }
    }

    use {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        requires = {'ms-jpq/coq.artifacts', branch = 'artifacts'}
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup()
        end
    }

    use {
        'phaazon/hop.nvim',
        branch = 'v1', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }
end)
