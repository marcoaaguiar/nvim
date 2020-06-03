" VIM Meta
nnoremap <leader>vr :source $MYVIMRC<CR>
nnoremap <leader>vc :e $MYVIMRC<CR>

" Mapping for buffer movement
nmap <leader>i :bn<cr>
nmap <leader>h :bp<cr>
tmap <leader>i <C-\><C-n>:bn<cr>
tmap <leader>h <C-\><C-n>:bp<cr>
nmap g<del> :b#<bar>bd#<cr>

" Map space to leader
map <space> <leader>
" let mapleader = " "
" nnoremap <space> <nop>
" noremap <space> <nop>

" Map python autoimport
map <F5> :ImportName<CR>

" clear search results
nnoremap <silent> // :noh<CR>

" clear empty spaces at the end of lines on save of python files
" autocmd BufWritePre *.py :%s/\s\+$//e

" move through split
nnoremap <C-N> <C-W><C-J>
nnoremap <C-E> <C-W><C-K>
nnoremap <C-I> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
