lua require('plugins')
lua require('lsp_config')
lua require('treesitter')

" configuration
source ~/.config/nvim/config/main.vim

colorscheme catppuccin
set termguicolors " this variable must be enabled for colors to be applied properly


" lua << EOF
" vim.lsp.set_log_level("debug")
" EOF
