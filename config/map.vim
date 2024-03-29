map <Space> <Leader>
vnoremap y "+y

inoremap <C-c> <Esc>

" search
nnoremap <silent> <Leader>c :nohl<Bar>:echo<CR>


" tab - dont use it
" nnoremap <C-T> :tabnew<CR>
" nnoremap <Tab> :tabprevious<CR>
" nnoremap <S-Tab> :tabnext<CR>
" nnoremap <silent> <C-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
" nnoremap <silent> <C-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" fast move
noremap <S-l> 4l
noremap <S-h> 4h
noremap <S-j> 4j
noremap <S-k> 4k
 
" fast window jump
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

noremap <leader>j J

" show new lines
nmap <silent> <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" disable ZZ exit
nnoremap Z <Nop>
nnoremap ZZ <Nop>


" switch to previous file
nnoremap <silent> <Tab> :e#<CR>

" telescope
nnoremap ; <cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files,--glob=!.git/<cr>
nnoremap ` <cmd>Telescope buffers<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
vnoremap <leader>f "zy:Telescope live_grep default_text=<C-r>z<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" LSP + telescope
nnoremap <silent> gr :lua require'telescope.builtin'.lsp_references{}<cr>
nnoremap <silent> gi :lua require'telescope.builtin'.lsp_implementations{}<cr>
nnoremap <silent> gd :lua require'telescope.builtin'.lsp_definitions{}<cr>
nnoremap <silent> gt :lua require'telescope.builtin'.lsp_type_definitions{}<cr>

" nnoremap <leader><Tab> <cmd>TODO file browser<cr>

" NvimTree
nnoremap <silent> <C-n> :NvimTreeToggle<CR>
nnoremap <silent> <C-o> :NvimTreeFindFile<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

" vim-floaterm
nnoremap <silent> <leader>t :FloatermNew<CR>
nnoremap <silent> <leader>T :FloatermNew! cd %:p:h<CR>

" spell
map <F8> :setlocal spell! spelllang=en,ru<CR>

" execute and pase yanked text
nnoremap <leader>x :r !echo '\n>>>\n' && <C-r>"<CR>
