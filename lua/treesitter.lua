require'nvim-treesitter.configs'.setup {
    refactor = {
        highlight_definitions = { enable = true },
    },
}

require('nvim-tree').setup{
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
}

require'lualine'.setup{
    options = {
        section_separators = '',
        component_separators = ''
    }
}
