" lua <<EOF
" require'indent-blankline'
" EOF
" let g:indentLine_char = '⎸'
" let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']
let g:indent_blankline_char_list = ['┆']
let g:indent_blankline_filetype_exclude = ['help', 'startify', 'term', '']
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_context_patterns = ['^if', 'class', 'function', 'method', '^for']
