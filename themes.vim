" apply gruvbox
set t_Co =256
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1

" nord theme
if (has("termguicolors"))
    set termguicolors
endif
" Adds correct highlighting of JSONC files
autocmd FileType json syntax match Comment +\/\/.\+$+
  

colorscheme nord
" colorscheme gruvbox
