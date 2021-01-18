" Fzf ----------------------------
let g:fzf_history_dir= stdpath('data').'/fzf/history'



command! -bang -nargs=? -complete=dir 
            \ Files call fzf#run(fzf#wrap({'source': "fdfind --type f $( test -f .fzfignore && cat .fzfignore | sed -e 's@^@-E @' -e '$a -I' )"}))

command! -bang -nargs=? -complete=dir 
            \ FilesAll call fzf#run(fzf#wrap({'source': "fdfind --hidden --no-ignore"}))

command! -bang -nargs=? -complete=dir 
            \ ConfFiles call fzf#run(fzf#wrap({'source': 'fdfind . --type f --full-path '.stdpath('config') }))

" file finder mapping
nmap ,e :Files<CR>
" All files (hidden and ignored included) finder mapping
nmap ,E :FilesAll<CR>
" tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" the same, but with the word under the cursor pre filled
nmap ,wg :execute ":BTag " . expand('<cword>')<CR>
" tags (symbols) in all files finder mapping
nmap ,G :Tags<CR>
" the same, but with the word under the cursor pre filled
nmap ,wG :execute ":Tags " . expand('<cword>')<CR>
" general code finder in current file mapping
nmap ,f :BLines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wf :execute ":BLines " . expand('<cword>')<CR>
" general code finder in all files mapping
nmap ,F :Rg<CR>
" the same, but with the word under the cursor pre filled
nmap ,wF :execute ":Lines " . expand('<cword>')<CR>
" commands finder mapping
nmap ,c :Commands<CR>

" open buffers
nmap ,b :Buffers<CR>

" open buffers
nmap ,s :Snippets<CR>

set ttimeout
set ttimeoutlen=0


