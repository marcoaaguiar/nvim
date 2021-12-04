vim.cmd[[
    call wilder#enable_cmdline_enter()
    set wildcharm=<Tab>
    cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
    cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

    " only / and ? are enabled by default
    call wilder#set_option('modes', ['/', '?', ':'])
    call wilder#set_option('renderer', wilder#popupmenu_renderer({'highlighter': wilder#basic_highlighter(), 'left': [wilder#popupmenu_devicons()]}))


    call wilder#set_option('pipeline', [ wilder#branch( wilder#python_file_finder_pipeline({ 'file_command': {_, arg -> arg == ""? ["fdfind", "-d", "1"]: stridx(arg, '.') != -1 ? ['fdfind', '-tf', '-H'] : ['fdfind', '-tf']}, 'dir_command': ['fdfind', '-td'], }), [ wilder#check({_, x -> empty(x)}), wilder#history(), wilder#result({ 'draw': [{_, x -> ' ' . x}], }), ], wilder#cmdline_pipeline(), wilder#search_pipeline(),), ]) ]]
