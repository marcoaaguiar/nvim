vim.cmd[[
" Basic settings
syntax on " Activate syntax highlighting
set hidden
set noerrorbells " don't use system bell for errors (backspacing an empty line)
set tabstop=4 " Change default tab
set softtabstop=4 " Change default tab
set shiftwidth=4 " Change default tab
set expandtab " Uses spaces instead of tabs
set nu " Display line numbers
set nowrap " Don't wrap lines that are longer than the window/buffer
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching unless it has an Upper Case
set noswapfile
set nobackup
set undodir=~/.config/nvim/.undodir " folder do save the undo commands
set undofile " save undos in a undofile (persist undo between sessions)
set incsearch " search while typing (don't wait for enter to start to search)
set autoread
set nostartofline
set winblend=10 " pseudo transparency for floating windows
set fileformat=unix
set fileformats=unix,dos
set nocp
set signcolumn=yes

set mouse=a " Use mouse in all modes (visual, normal, insert, ...)

set mmp=5000

set encoding=utf-8
let using_neovim = has('nvim')
let using_vim = !using_neovim
let fancy_symbols_enabled = 1
set scrolloff=4
filetype plugin on 

" GUI
set guifont=CaskaydiaCove\ NF:h14
highlight link NormalFloat CursorColumn

let g:python3_host_prog='~/.config/nvim/.venv/bin/python3'
" highlight yanked text
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END

" Relative line number (auto hybrid)
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * if &number | set relativenumber | endif
  autocmd BufLeave,FocusLost,InsertEnter   * if &number | set norelativenumber | endif
augroup END

set splitbelow " create new splits bellow the current buffer
set splitright " create new splits to the right of the current buffer

" Auto reload modified files
autocmd BufEnter,FocusGained * checktime

" less cluttered vertical window separators
let &fillchars='vert: '           

" Folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99               " start unfolded

" Multi-mode mappings (Normal, Visual, Operating-pending modes).
noremap Y y$

" Remove Ex mode
nnoremap Q <Nop>

" Remove weird behaviour when typing :
set indentkeys-=<:>
set indentkeys-=:

" make hyphenized words to be considered a single word
set iskeyword+=\-
]]
