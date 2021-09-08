" apply gruvbox
set t_Co =256
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1

" nord theme
if (has("termguicolors"))
    set termguicolors
endif

" moonlight
let g:material_style = 'moonlight'

" Adds correct highlighting of JSONC files
autocmd FileType json syntax match Comment +\/\/.\+$+
  

lua <<EOF
local nightfox = require('nightfox')

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
  fox = "nordfox", -- change the colorscheme to use nordfox
  hlgroups = {
    TSPunctDelimiter = { fg = "${red}" }, -- Override a highlight group with the color red
    LspCodeLens = { bg = "#000000", style = "italic" },
  }
})
EOF

" let g:nightfox_style = "nordfox"
" 
