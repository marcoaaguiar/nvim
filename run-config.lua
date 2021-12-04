vim.api.nvim_set_keymap('n', '<F5>', ':wa <CR> :RunLast<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F17>', ':wa <CR> :Run<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F6>', ':wa <CR> :Run iterative<CR>', {noremap = true, silent = true})
