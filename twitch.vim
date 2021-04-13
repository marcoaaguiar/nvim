
let s:twitch_terminal_window = -1
let s:twitch_terminal_buffer = -1
let s:twitch_terminal_job_id = -1

function! TwitchTerminalOpen()
    " call MonkeyTerminalOpen()
    " Check if buffer exists, if not create a window and a buffer
    if !bufexists(s:twitch_terminal_buffer)
        " Creates a window call twitch_terminal
        new twitch_terminal
        " Moves to the window the bellow the current one
        wincmd J
        let s:twitch_terminal_job_id = termopen("weechat", { 'detach': 1 })

        " Change the name of the buffer to "Terminal 1"
        silent file Twitch
        
        " Set properties to the window
        setlocal nonumber norelativenumber
        set signcolumn=no
        resize 6
        setlocal winfixheight
        set winhighlight=Search:
        execute "VimadeBufDisable"
         
        " Gets the id of the terminal window
        let s:twitch_terminal_window = win_getid()
        let s:twitch_terminal_buffer = bufnr('%')

        " if exists('g:twitch_terminal_startup')
        "     call chansend(s:twitch_terminal_job_id, g:twitch_terminal_startup)
        " endif

        " The buffer of the terminal won't appear in the list of the buffers
        " when calling :buffers command
        " set nobuflisted
    else
        if !win_gotoid(s:twitch_terminal_window)
            exec "6sp"
            " Moves to the window below the current one
            wincmd J   
            resize 6
            setlocal winfixheight
            buffer Twitch
            " Gets the id of the terminal window
            let s:twitch_terminal_window = win_getid()
        endif
    endif
endfunction

function! TwitchTerminalToggle()
    if win_gotoid(s:twitch_terminal_window)
        call TwitchTerminalClose()
    else
        call TwitchTerminalOpen()
    endif
endfunction

function! TwitchTerminalClose()
    if win_gotoid(s:twitch_terminal_window)
        " close the current window
        hide
    endif
endfunction

nnoremap <silent> <F9> :call TwitchTerminalToggle()<cr>
