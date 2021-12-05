require("trouble").setup {}


vim.api.nvim_set_keymap('n', '<F4>', ':TroubleToggle lsp_document_diagnostics<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F16>', ':TroubleToggle<CR>', {noremap = true, silent = true})
