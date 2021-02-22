let g:tex_flavor='latex'
" let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_method='latexmk'
" let g:vimtex_latexmk_options = '-pdf -verbose -file-line-error -synctex=1'
let g:vimtex_compiler_latexmk = {
            \ 'backend' : 'nvim',
            \ 'background' : 1,
            \ 'build_dir' : '',
            \ 'callback' : 1,
            \ 'continuous' : 0,
            \ 'executable' :'latexmk',
            \ 'hooks' : [],
            \ 'options' : [
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \   '-shell-escape',
            \ ],
            \}

nnoremap <leader>lf :w <CR> \| :!latexindent -w -s --yaml='defaultIndent:"    ",removeTrailingWhitespace:1' % <CR> \| :e <CR> \| :echo "Document Formated!" <CR>

" nnoremap <leader>lf :%!latexindent <CR>
augroup tex_settings
    autocmd!
    autocmd BufEnter *.tex :set wrap linebreak
    autocmd BufEnter *.tex :set scrolloff=10

    autocmd FileType tex echo "Tex file"
    " change in $
    autocmd FileType tex xmap <buffer> u$ <plug>(vimtex-i$)
    autocmd FileType tex omap <buffer> u$ <plug>(vimtex-i$)
     
    " change in env
    autocmd FileType tex xmap <buffer> ue <plug>(vimtex-ie)
    autocmd FileType tex omap <buffer> ue <plug>(vimtex-ie)
     
    " change in command
    autocmd FileType tex xmap <buffer> uc <plug>(vimtex-ic)
    autocmd FileType tex omap <buffer> uc <plug>(vimtex-ic)
     
    " chang in delimiter
    autocmd FileType tex xmap <buffer> ud <plug>(vimtex-id)
    autocmd FileType tex omap <buffer> ud <plug>(vimtex-id)
     
    " chang in item 
    autocmd FileType tex xmap <buffer> ui <plug>(vimtex-ii)
    autocmd FileType tex omap <buffer> ui <plug>(vimtex-ii)
augroup end

