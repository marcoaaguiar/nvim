" let g:startify_session_autoload = 1
let g:startify_session_persistence = 1 " save open session on quit
let g:startify_fortune_use_unicode = 1 " use unicode char for the top message box
let g:startify_session_sort = 1 " sort sessions by last used
let g:startify_change_to_dir = 0 " cd to file dir when opening file
" let g:startify_center = 1
let g:startify_custom_header =
          \ 'startify#center(startify#fortune#cowsay())'
let g:startify_lists = [
    \ { 'type': 'dir',       'header': startify#center(['MRU '.getcwd()]) },
    \ { 'type': 'sessions',  'header': startify#center(['Sessions']) },
    \ { 'type': 'files',     'header': startify#center(['MRU']) },
    \ { 'type': 'bookmarks', 'header': startify#center(['Bookmarks']) },
    \ { 'type': 'commands',  'header': startify#center(['Commands']) },
    \ ]
let g:startify_padding_left = 68 " Hard coded padding for lists
