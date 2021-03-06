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

" Run go
nnoremap <silent><Leader>r :vsplit term://go run %<CR>

" Open buffrs
nmap <silent> <leader>w :Buffers<CR>

" Search current position text
nnoremap <silent> <F2> "zyiw:exe "Rg ".@z.""<CR>

" Search selected text
xnoremap <silent> <F2> "zy:exe "Rg ".@z.""<CR>

" Search text
nnoremap <silent> <F1> :Rg<CR>

" Go rename
nnoremap <silent> <F6> :GoRename<CR>
