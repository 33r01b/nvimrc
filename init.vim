" vim-floaterm
let g:floaterm_autoclose=2

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

"hi ColorColumn guibg=#332E41
"hi ColorColumn guibg=#332E41
"hi NvimTreeVertSplit guibg=#332E41
hi ColorColumn guibg=#262626
hi CursorLine guibg=#262626
hi NvimTreeVertSplit guibg=#262626
hi NvimTreeNormal guibg=none
hi lualine_c_normal guibg=none
hi lualine_c_normal guibg=#262626


" run gofmt on save
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
