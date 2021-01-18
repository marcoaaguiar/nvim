let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/wikis/thesis/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

augroup vimwiki_settings
    autocmd!
    autocmd FileType vimwiki :set wrap linebreak
    autocmd FileType vimwiki :set scrolloff=10
augroup end
