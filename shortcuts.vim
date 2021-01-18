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
nnoremap <S-A-o> O <Esc>
nnoremap <A-o> o <Esc>
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

" shortcuts for []
nnoremap <silent> dar da[
nnoremap <silent> yar ya[
nnoremap <silent> car ca[
nnoremap <silent> dur di[
nnoremap <silent> yur yi[
nnoremap <silent> cur ci[

" Show highlight group for word under cursor
" nmap <C-S-T> :call <SID>SynStack()<CR>

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
