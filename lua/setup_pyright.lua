vim.cmd[[function! SetupFn() abort
    let filename = expand('.vim/coc-settings.json')
    if !empty(expand(glob(filename)))
        let config = json_decode(join(readfile(filename)))
    else
        call mkdir(".vim/","p")
        let config = {}
    endif
    let config['python.pythonPath'] = substitute(system("poetry env info --path") . '/bin/python', '\n', '', '')
    echo config
    call writefile([json_encode(config)], filename)
endfunction

command! SetupCocPoetry call SetupFn()
]]
