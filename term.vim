if has('nvim')
    fun! CreateTermMappings()
        :tnoremap <buffer> <C-n> <down>
        :tnoremap <buffer> <C-e> <up>
        " Apply the following mappings except for this file types 
        if &ft =~ 'fzf'
            return
        endif
        :tnoremap <buffer> <C-w> <C-\><C-n><C-w>
        :tnoremap <buffer> <Esc><Esc> <C-\><C-n>
        :nnoremap <buffer> <C-c> Aarsta
    endfun
    autocmd TermEnter * call CreateTermMappings()
endif 
augroup terminal_settings
    autocmd!

    " autocmd BufWinEnter,WinEnter term://* startinsert
    " autocmd BufLeave term://* stopinsert

    " Ignore various filetypes as those will close terminal automatically
    " Ignore fzf, ranger, coc
    autocmd TermClose term://*
                \ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
                \   call nvim_input('<CR>')  |
                \ endif
augroup END
