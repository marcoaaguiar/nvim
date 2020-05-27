" Mapping for buffer movement
nmap  gn :bn<cr>
nmap gp :bp<cr>
nmap g<del> :bd<cr>

" Map space to leader
:map <space> <leader>
" let mapleader = " "
" nnoremap <space> <nop>
" noremap <space> <nop>

" Map python autoimport
map <F5> :ImportName<CR>

" clear search results
nnoremap <silent> // :noh<CR>

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" move through split
nnoremap <C-N> <C-W><C-J>
nnoremap <C-E> <C-W><C-K>
nnoremap <C-I> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
