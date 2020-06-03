if using_neovim
    call plug#begin("~/.config/nvim/plugged")
else
    call plug#begin("~/.vim/plugged")
endif
" Nerd fonts
Plug 'ryanoasis/vim-devicons'

" Stable version of coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Gruvbox theme
Plug 'morhetz/gruvbox'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Better file browser
Plug 'scrooloose/nerdtree'

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Completion from other opened files
Plug 'Shougo/context_filetype.vim'

" Surround
Plug 'tpope/vim-surround'

" Indent text object
Plug 'michaeljsmith/vim-indent-object'

" Git integration
Plug 'tpope/vim-fugitive'

" Guttentag
Plug 'ludovicchabant/vim-gutentags'

" Python autoimport
Plug 'mgedmin/python-imports.vim'

" Comment out lines
Plug 'preservim/nerdcommenter'

" Plug
Plug 'kana/vim-arpeggio'

" List of class and methods in file
Plug 'majutsushi/tagbar'

" Zoom in window
Plug 'troydm/zoomwintab.vim'

" Show ident lines
Plug 'Yggdroot/indentLine'
call plug#end()

