-- Edit snippets
vim.api.nvim_set_keymap('n', '<leader>ve', '.UltiSnipsEdit<CR>', {noremap = true})

-- Set ultisnips triggers
vim.g.UltiSnipsExpandTrigger = "<tab>"                                            
vim.g.UltiSnipsJumpForwardTrigger = "<tab>"                                       
vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"  
