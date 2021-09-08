lua <<EOF
require('telescope').setup{
defaults = {
    mappings = {
        i = {
            ["<esc>"] = require('telescope.actions').close,
            },
        },
    },
extensions = {
    fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
        }
    }
}
require('telescope').load_extension('ultisnips')
require('telescope').load_extension('neoclip')
require('neoclip').setup()
EOF


" file finder mapping
nnoremap ,e <cmd>Telescope find_files<cr>

" All files (hidden and ignored included) finder mapping
nnoremap ,E <cmd>Telescope find_files find_command=fdfind,--type,f,--hidden,--no-ignore<cr>

" nmap ,E :FilesAll<CR>
" tags (symbols) in current file finder mapping
nnoremap ,g <cmd>Telescope current_buffer_tags<cr>

" tags (symbols) in all files finder mapping
nnoremap ,G <cmd>Telescope tags<cr>

" general code finder in current file mapping
nnoremap ,f <cmd>Telescope current_buffer_fuzzy_find<cr>

" general code finder in all files mapping
nnoremap ,F <cmd>Telescope live_grep<cr>

" commands finder mapping
nnoremap ,c <cmd>Telescope commands<cr>

" open buffers
nnoremap ,b <cmd>Telescope buffers<cr>

" snippets 
nnoremap ,s <cmd>Telescope ultisnips<cr>

" Help tags
nnoremap ,h <cmd>Telescope help_tags<cr>

" Colorschemes
nnoremap ,C <cmd>Telescope colorscheme<cr>

" Keymaps
nnoremap ,k <cmd>Telescope keymaps<cr>

" Keymaps
nnoremap ,y <cmd>Telescope neoclip<cr>
