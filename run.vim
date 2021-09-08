" With this function you can reuse the same terminal in neovim.
" You can toggle the terminal and also send a command to the same terminal.

let s:monkey_terminal_window = -1
let s:monkey_terminal_buffer = -1
let s:monkey_terminal_job_id = -1

function! MonkeyTerminalOpen()
    " Check if buffer exists, if not create a window and a buffer
    if !bufexists(s:monkey_terminal_buffer)
        " Creates a window call monkey_terminal
        new monkey_terminal
        " Moves to the window the right the current one
        wincmd L
        let s:monkey_terminal_job_id = termopen($SHELL, { 'detach': 1 })

        " Change the name of the buffer to "Terminal 1"
        silent file Terminal\ 1
        " Gets the id of the terminal window
        let s:monkey_terminal_window = win_getid()
        let s:monkey_terminal_buffer = bufnr('%')

        if exists('g:monkey_terminal_startup')
            call chansend(s:monkey_terminal_job_id, g:monkey_terminal_startup)
        endif

        setlocal nonumber norelativenumber
        set signcolumn=no
        " The buffer of the terminal won't appear in the list of the buffers
        " when calling :buffers command
        " set nobuflisted
    else
        if !win_gotoid(s:monkey_terminal_window)
            vsp
            " Moves to the window below the current one
            " wincmd L   
            buffer Terminal\ 1
            " Gets the id of the terminal window
            let s:monkey_terminal_window = win_getid()
        endif
    endif
endfunction

function! MonkeyTerminalToggle()
    if win_gotoid(s:monkey_terminal_window)
        call MonkeyTerminalClose()
    else
        call MonkeyTerminalOpen()
    endif
endfunction

function! MonkeyTerminalClose()
    if win_gotoid(s:monkey_terminal_window)
        " close the current window
        hide
    endif
endfunction

function! MonkeyTerminalKillChild()
    " Close any process that is running in the terminal
    call system('kill $(ps --ppid ' . jobpid(s:monkey_terminal_job_id) .' -o pid --no-headers)')
endfunction

function! MonkeyTerminalExec(cmd)
    if !win_gotoid(s:monkey_terminal_window)
        call MonkeyTerminalOpen()
    endif
    call MonkeyTerminalKillChild()
    normal :5sleep
    " clear current input
    " call jobsend(s:monkey_terminal_job_id, "clear\n")

    " run cmd
    call chansend(s:monkey_terminal_job_id, a:cmd . "\n")
    normal! G
    wincmd p
endfunction


" With this maps you can now toggle the terminal
nnoremap <F8> :call MonkeyTerminalToggle()<cr>
tnoremap <F8> <C-\><C-n>:call MonkeyTerminalToggle()<cr>

" This an example on how specify command with different types of files.
augroup python_run
    autocmd!
    let g:monkey_terminal_startup = ['export PYTHONPATH=' . expand('$PWD') , 'envup', '']
    " autocmd BufRead,BufNewFile *.py set filetype=python
    " autocmd FileType python nnoremap <buffer> <silent> <F5> :w <CR> :call MonkeyTerminalExec('poetry run ipython ' . expand('%'))<cr>
    " autocmd FileType python nnoremap <buffer> <silent> <F6> :w <CR> :call MonkeyTerminalExec('poetry run ipython -i ' . expand('%'))<cr>
augroup END

augroup dot_run
    autocmd!
    autocmd FileType dot nnoremap <buffer> <silent> <F5> :w <CR> :call MonkeyTerminalExec('dot2tex --autosize ' . expand('%') . ' > ' . expand('%:r'). '.tex && pdflatex -halt-on-error ' . expand('%:r'). '.tex')<cr>
augroup END

augroup go
    autocmd!
    autocmd BufRead,BufNewFile *.go set filetype=go
    autocmd FileType go nnoremap <F5> :call MonkeyTerminalExec('go run ' . expand('%'))<cr>
augroup END

augroup tex
    autocmd!
    " autocmd bufread,bufnewfile *.go set filetype=go
    autocmd filetype tex nnoremap <buffer> <f5> :VimtexCompile<cr>
    autocmd filetype tex nnoremap <buffer> <f6> :CocRestart<cr>
augroup end
