" apply gruvbox
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1

" Adds correct highlighting of JSONC files
autocmd FileType json syntax match Comment +\/\/.\+$+
  
