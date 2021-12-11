map <Space> <Leader>
vnoremap y "+y

inoremap <C-c> <Esc>

" search
nnoremap <silent> <Leader>c :nohl<Bar>:echo<CR>

" tab
nnoremap <C-T> :tabnew<CR>
nnoremap <Tab> :tabprevious<CR>
nnoremap <S-Tab> :tabnext<CR>
nnoremap <silent> <C-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

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

" show new lines
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" disable ZZ exit
nnoremap Z <Nop>
nnoremap ZZ <Nop>


" telescope
nnoremap ; <cmd>Telescope find_files<cr>
nnoremap <Tab> <cmd>Telescope buffers<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" hop
nnoremap S <cmd>HopPattern<cr>
nnoremap s <cmd>HopChar1<cr>

" nnoremap <leader><Tab> <cmd>TODO file browser<cr>

" NvimTree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

" vim-floaterm
nnoremap <leader>t :FloatermNew --autoclose=2<CR>
