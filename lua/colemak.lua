-- " colemak
-- set langmap=sd,fe,tf,dg,ui,nj,ek,il,kn,yo,\\;p,pr,rs,gt,lu,jy,SD,FE,TF,DG,UI,NJ,EK,IL,KN,YO,:P,PR,RS,GT,LU,JY,o\\;,O:

-- get control-j back, so switch it with ctrl-n at qwerty position of j
vim.api.nvim_set_keymap('i', '<c-n>', '<cr>', {})
vim.api.nvim_set_keymap('c', '<c-n>', '<cr>', {})
vim.api.nvim_set_keymap('i', '<c-j>', '<c-n>', {noremap=true})
vim.api.nvim_set_keymap('c', '<c-j>', '<c-n>', {noremap=true})

-- rotate some keys about to get qwerty "hjkl" back for movement
vim.api.nvim_set_keymap('n', 'n', '<down>', {noremap=true})
vim.api.nvim_set_keymap('n', 'e', '<up>', {noremap=true})
vim.api.nvim_set_keymap('n', 'i', '<right>', {noremap=true})
vim.api.nvim_set_keymap('v', 'n', '<down>', {noremap=true})
vim.api.nvim_set_keymap('v', 'e', '<up>', {noremap=true})
vim.api.nvim_set_keymap('n', 'i', '<right>', {noremap=true})

-- move these keys to their qwerty positions because they are
-- in the way of hjkl (and E for J)
vim.api.nvim_set_keymap('n', 'k', 'n', {noremap=true})
vim.api.nvim_set_keymap('n', 'K', 'N', {noremap=true})
vim.api.nvim_set_keymap('n', 'u', 'i', {noremap=true})
vim.api.nvim_set_keymap('n', 'U', 'I', {noremap=true})
vim.api.nvim_set_keymap('n', 'l', 'u', {noremap=true})
vim.api.nvim_set_keymap('n', 'L', 'U', {noremap=true})
vim.api.nvim_set_keymap('n', 'N', 'J', {noremap=true})
vim.api.nvim_set_keymap('n', 'E', 'K', {noremap=true})
vim.api.nvim_set_keymap('n', 'I', 'L', {noremap=true})

-- this is the only key that isn't in qwerty or colemak position
vim.api.nvim_set_keymap('n', 'j', 'e', {noremap=true})
vim.api.nvim_set_keymap('n', 'J', 'E', {noremap=true})

-- window movement
vim.api.nvim_set_keymap('n', '<c-w>n', '<c-w>j', {noremap=true})
vim.api.nvim_set_keymap('n', '<c-w>i', '<c-w>l', {noremap=true})
vim.api.nvim_set_keymap('n', '<c-w>e', '<c-w>k', {noremap=true})

-- qwerty <c-w>n and <c-w>i stolen but do nothing so map back
vim.api.nvim_set_keymap('n', '<c-w>k', '<c-w>n', {noremap=true})
vim.api.nvim_set_keymap('n', '<c-w>l', '<c-w>i', {noremap=true})

-- pentadactyl binds ctrl-h to history otherwise
vim.api.nvim_set_keymap('', '<c-h>', '<BS>', {})
vim.api.nvim_set_keymap('c', '<c-h>', '<BS>', {})
