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
Plug 'arcticicestudio/nord-vim'

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

" Surround an text element with (), [], ...
Plug 'tpope/vim-surround'

" Indent text object
" Plug 'michaeljsmith/vim-indent-object'

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
" Plug 'Yggdroot/indentLine'

" Vimspector
Plug 'puremourning/vimspector'

" Git change marks
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" Latex
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} " for VimPlug

" Smooth scrolling
Plug 'psliwka/vim-smoothie'

" Tips for improving vim movement
if has('python3') && has('timers')
    Plug 'AlphaMycelium/pathfinder.vim'
else
    echoerr 'pathfinder.vim is not supported on this Vim installation'
endif

" Track the engine.
Plug 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'reconquest/vim-pythonx'

" Goyo (minimalistic view)
Plug 'junegunn/goyo.vim'
call plug#end()


