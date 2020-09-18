" Basic settings
syntax on
set noerrorbells
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/.undodir
set undofile
set incsearch
set autoread
set nostartofline

set encoding=utf-8
let using_neovim = has('nvim')
let using_vim = !using_neovim
let fancy_symbols_enabled = 1
set scrolloff=4
filetype plugin on 

let g:python3_host_prog='/usr/bin/python3.7'
" highlight yanked text
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END

" Relative line number (auto hybrid)
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

set splitbelow
set splitright

" Auto reload modified files
autocmd BufEnter,FocusGained * checktime

" Folding
if has('folding')
  if has('windows')
    let &fillchars='vert: '           " less cluttered vertical window separators
  endif
  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded
endif

" Multi-mode mappings (Normal, Visual, Operating-pending modes).
noremap Y y$
