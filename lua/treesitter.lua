require('nvim-treesitter.configs').setup({
    ensure_installed = "all",
    refactor = {
        highlight_definitions = {enable = true},
    },
    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
})

require('nvim-tree').setup({
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    renderer = {
        highlight_git = true,
        icons = {
            show = {
                git = true,
                folder = true,
                file = false,
                folder_arrow = true,
            }
        }
    },
    actions = {
        open_file = {
            resize_window = true
        }
    },
})

require('lualine').setup({
    options = {
        section_separators = '',
        component_separators = '',
        theme = "codedark"
    },
})

-- venn.nvim: enable or disable keymappings
function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd[[setlocal ve=all]]
        -- draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
        -- draw a box by pressing "f" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
    else
        vim.cmd[[setlocal ve=]]
        vim.cmd[[mapclear <buffer>]]
        vim.b.venn_enabled = nil
    end
end
-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", {noremap = true})

-- theme
require("catppuccin").setup({
    transparent_background = true,
    term_colors = true,
})

-- telescope
require("telescope").setup({
    pickers = {
        live_grep = {
            additional_args = function(opts)
                return {"--hidden", "--no-ignore", "--glob=!.git/"}
            end
        },
    },
})
