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
        :nnoremap <buffer> <C-c> A<C-c><C-n><C-w>
        tnoremap <C-Down> <C-\><C-n><C-W><C-J>
        tnoremap <C-Up> <C-\><C-n><C-W><C-K>
        tnoremap <C-Right> <C-\><C-n><C-W><C-L>
        tnoremap <C-Left> <C-\><C-n><C-W><C-H>

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
