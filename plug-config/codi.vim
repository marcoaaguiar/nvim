nnoremap <F8> :call ToggleCodi()<cr>
" nnoremap <F8> :Codi!!<cr>

let g:codi#raw = 0
let g:codi#rightsplit = 1
let g:codi#rightalign = 0
let g:codi#virtual_text = 1
" let g:codi#virtual_text_prefix = "➡️ "

function! ToggleCodi()
    if !exists("b:codi_is_open") || !b:codi_is_open 
        let b:codi_is_open = 1
        echo "Starting Codi"
        execute 'Codi '.&filetype
    else
        let b:codi_is_open = 0
        echo "Stopping Codi"
        execute 'Codi!'
    endif
endfunction
