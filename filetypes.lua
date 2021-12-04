-- Filetype specific commands
-- No lua equivalent for autocmd yet
vim.cmd[[
    autocmd Filetype json setlocal ts=2 sw=2 expandtab
    autocmd Filetype js setlocal ts=2 sw=2 expandtab
    autocmd Filetype typescript setlocal ts=2 sw=2 expandtab
    autocmd Filetype html setlocal ts=2 sw=2 expandtab
    autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
    autocmd Filetype rasi setlocal ts=2 sw=2 expandtab
    autocmd Filetype NvimTree setlocal ts=2 sw=2 expandtab
    autocmd Filetype python setlocal indentkeys-=<:>
    autocmd Filetype python setlocal indentkeys-=:
    autocmd Filetype yaml setlocal indentkeys-=<:>
    autocmd Filetype yaml setlocal indentkeys-=:
]]
