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

-- file finder mapping
vim.api.nvim_set_keymap('n', ',e', '<cmd>Telescope find_files<cr>', {noremap = true})

-- All files (hidden and ignored included) finder mapping
vim.api.nvim_set_keymap('n', ',E', '<cmd>Telescope find_files find_command=fdfind,--type,f,--hidden,--no-ignore<cr>', {noremap = true})

-- nmap ,E :FilesAll<CR>
-- tags (symbols) in current file finder mapping
vim.api.nvim_set_keymap('n', ',g', '<cmd>Telescope current_buffer_tags<cr>', {noremap = true})

-- tags (symbols) in all files finder mapping
vim.api.nvim_set_keymap('n', ',G', '<cmd>Telescope tags<cr>', {noremap = true})

-- general code finder in current file mapping
vim.api.nvim_set_keymap('n', ',f', '<cmd>Telescope current_buffer_fuzzy_find<cr>', {noremap = true})

-- general code finder in all files mapping
vim.api.nvim_set_keymap('n', ',F', '<cmd>Telescope live_grep<cr>', {noremap = true})

-- commands finder mapping
vim.api.nvim_set_keymap('n', ',c', '<cmd>Telescope commands<cr>', {noremap = true})

-- open buffers
vim.api.nvim_set_keymap('n', ',b', '<cmd>Telescope buffers<cr>', {noremap = true})

-- snippets 
vim.api.nvim_set_keymap('n', ',s', '<cmd>Telescope ultisnips<cr>', {noremap = true})

-- Help tags
vim.api.nvim_set_keymap('n', ',h', '<cmd>Telescope help_tags<cr>', {noremap = true})

-- Colorschemes
vim.api.nvim_set_keymap('n', ',C', '<cmd>Telescope colorscheme<cr>', {noremap = true})

-- Keymaps
vim.api.nvim_set_keymap('n', ',k', '<cmd>Telescope keymaps<cr>', {noremap = true})

-- Keymaps
vim.api.nvim_set_keymap('n', ',y', '<cmd>Telescope neoclip<cr>', {noremap = true})
