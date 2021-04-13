" VIM Meta
command! -range=% Exec call execute(getline(<line1>, <line2>), '')

nnoremap <leader>vr :source $MYVIMRC<CR>
nnoremap <leader>vs :Exec<CR>
vnoremap <leader>vs :Exec<CR>
nnoremap <leader>vc :e $MYVIMRC<CR>
if exists(":ConfFiles")
    nnoremap <leader>vf :ConfFiles<CR>
endif

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
map <leader>u :ImportName<CR>

" clear search results
nnoremap <silent> // :noh<CR>

" clear empty spaces at the end of lines on save of python files
" autocmd BufWritePre *.py :%s/\s\+$//e

" move through split
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

" Create new line above and below
nnoremap <S-A-o> O<Esc>
nnoremap <A-o> o<Esc>
" exit insert with 
" inoremap hh <Esc>

" Fold on shift-tab
nnoremap <s-tab> za

" keep selection after changing indentation
vnoremap < <gv
vnoremap > >gv

" change with register 0
vnoremap <A-c> c<c-r>0

nnoremap <silent> <C-N> :join!<CR>
vnoremap <silent> <C-N> :join!<CR>


" Show highlight group for word under cursor
nmap <C-A-T> :call <SID>SynStack()<CR>

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

vnoremap * "9y/\V<C-r>9<CR>

" Shift+<- or -> select word
nnoremap <silent> H vb
nnoremap <silent> I ve
vnoremap <silent> H b
vnoremap <silent> I e

" Move visual block
vnoremap <c-down> :m '>+1<CR>gv=gv
vnoremap <c-up> :m '<-2<CR>gv=gv

" yank to clipboard
nnoremap <c-y> "*y
 
" nmap <c-down> <Plug>(SmoothieDownwards) 
" nmap <c-up> <Plug>(SmoothieUpwards)

" sudo save protected files
" command -bang w!! normal w !sudo tee > /dev/null %
