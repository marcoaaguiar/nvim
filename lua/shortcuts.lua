-- Map space to leader
vim.api.nvim_set_keymap('', '<space>', '<leader>', {noremap = true, silent = true})

-- VIM Meta
vim.cmd[[
command! -range=% Exec call execute(getline(<line1>, <line2>), '')

" function! <SID>SynStack()
"    if !exists(--*synstack")
"        return
"    endif
"    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, --name")')
"endfunc
]]


vim.api.nvim_set_keymap('n', '<leader>vr', ':source $MYVIMRC<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>vs', ':Exec<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<leader>vs', ':Exec<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>vc', ':e $MYVIMRC<CR>', {noremap = true, silent = true})

-- vim.cmd[[
--     if exists(--:ConfFiles")
--         nnoremap <leader>vf :ConfFiles<CR>
--     endif
-- ]]

-- Mapping for buffer movement
-- vim.api.nvim_set_keymap('n', '<leader>i', ':bn<cr>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<leader>h', ':bp<cr>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('t', '<leader>i', '<C-\><C-n>:bn<cr>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('t', '<leader>h', '<C-\><C-n>:bp<cr>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', 'g<del>', ':b#<bar>bd#<cr>', {noremap = true, silent = true})

-- clear search results
vim.api.nvim_set_keymap('n', '//', ':noh<CR>', {noremap = true, silent = true})

-- clear empty spaces at the end of lines on save of python files
-- autocmd BufWritePre *.py :%s/\s\+$//e

-- move through split
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-W><C-J>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-W><C-K>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-W><C-L>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-W><C-H>', {noremap = true, silent = true})

-- Create new line above and below
vim.api.nvim_set_keymap('n', '<S-A-o>', 'O<Esc>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-o>', 'o<Esc>', {noremap = true, silent = true})
-- exit insert with 
-- inoremap hh <Esc>

-- Fold on shift-tab
vim.api.nvim_set_keymap('n', '<s-tab>', 'za', {noremap = true, silent = true})

-- keep selection after changing indentation
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- change with register 0
vim.api.nvim_set_keymap('v', '<A-c>', 'c<c-r>0', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<C-N>', ':join!<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-N>', ':join!<CR>', {noremap = true, silent = true})


-- Show highlight group for word under cursor
vim.api.nvim_set_keymap('n', '<C-A-T>', ':call <SID>SynStack()<CR>', {noremap = true, silent = true})

-- vim.api.nvim_set_keymap('v', '*', '"9y/\\V<C-r>9<CR>', {noremap = true, silent = true})

-- Shift+<- or -> select word
vim.api.nvim_set_keymap('n', 'H', 'vb', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'I', 've', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'H', 'b', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'I', 'e', {noremap = true, silent = true})

-- Move visual block
vim.api.nvim_set_keymap('v', '<c-down>', ":m '>+1<CR>gv=gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<c-up>', ":m '<-2<CR>gv=gv", {noremap = true, silent = true})

-- yank to clipboard
vim.api.nvim_set_keymap('n', '<c-y>', '"*y', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<c-s-c>', '"*y', {noremap = true, silent = true})
