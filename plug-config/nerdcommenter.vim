" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

nmap <C-/> <Plug>NERDCommenterToggle<CR>
vmap <C-/> <Plug>NERDCommenterToggle
nmap <C-_> <Plug>NERDCommenterToggle<CR>
vmap <C-_> <Plug>NERDCommenterToggle

