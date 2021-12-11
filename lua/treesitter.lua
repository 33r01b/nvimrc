require'nvim-treesitter.configs'.setup {
    refactor = {
        highlight_definitions = { enable = true },
    },
}

require('nvim-tree').setup{}

require'lualine'.setup{
    options = {
        section_separators = '',
        component_separators = ''
    }
}
