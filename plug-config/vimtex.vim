let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_method='latexmk'
let g:vimtex_latexmk_options = '-pdf -verbose -file-line-error -synctex=1'
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
            \ ],
            \}

nnoremap <leader>lf :w <CR> \| :!latexindent -w -s % <CR> \| :e <CR> \| :echo "Document Formated!" <CR>
" nnoremap <leader>lf :%!latexindent <CR>
augroup tex_settings
    autocmd!
    autocmd BufEnter *.tex :set wrap linebreak
augroup end

