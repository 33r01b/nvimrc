" vim-floaterm
let g:floaterm_autoclose=2

" nvim_tree
let g:nvim_tree_git_hl = 1
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 0,
    \ 'folder_arrows': 1,
    \ }

lua require('plugins')
lua require('lsp_config')
lua require('treesitter')

" configuration
source ~/.config/nvim/config/main.vim

colorscheme catppuccin
set termguicolors " this variable must be enabled for colors to be applied properly

set completeopt=menu,menuone,noselect

lua << EOF
vim.lsp.set_log_level("debug")
EOF

lua << EOF
vim.opt.spell = true
vim.opt.spelllang = { 'en_us', 'ru_ru' }
EOF


hi ColorColumn guibg=#332E41
