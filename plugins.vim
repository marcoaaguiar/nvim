if using_neovim
    call plug#begin("~/.config/nvim/plugged")
else
    call plug#begin("~/.vim/plugged")
endif
" " Nerd fonts
Plug 'ryanoasis/vim-devicons'

" " Stable version of coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" " Gruvbox theme
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'romgrk/doom-one.vim'

" " Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" " Better file browser
" Plug 'scrooloose/nerdtree'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
 
" " Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" " Completion from other opened files
Plug 'Shougo/context_filetype.vim'

" " Surround an text element with (), [], ...
Plug 'tpope/vim-surround'

" " Indent text object
" " Plug 'michaeljsmith/vim-indent-object'

" " Git integration
Plug 'tpope/vim-fugitive'

" " Git change marks
Plug 'mhinz/vim-signify'

" " Guttentag
Plug 'ludovicchabant/vim-gutentags'

" " Python autoimport
Plug 'mgedmin/python-imports.vim'

" " Comment out lines
Plug 'preservim/nerdcommenter'

" " Plug
" Plug 'kana/vim-arpeggio'

" " List of class and methods in file
Plug 'majutsushi/tagbar'

" " Zoom in window
Plug 'troydm/zoomwintab.vim'

" " Show ident lines
" " Plug 'Yggdroot/indentLine'

" " Vimspector
Plug 'puremourning/vimspector'


" " Latex
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} " for VimPlug

" " Smooth scrolling
Plug 'psliwka/vim-smoothie'

" Track the engine.
Plug 'SirVer/ultisnips'
"
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'reconquest/vim-pythonx'

" " Goyo (minimalistic view)
Plug 'junegunn/goyo.vim'

" " Clever f
" Plug 'rhysd/clever-f.vim'

" Use CTRL XA to swap things eg: false -> true
Plug 'bootleq/vim-cycle'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'p00f/nvim-ts-rainbow'
Plug 'romgrk/nvim-treesitter-context'

" Vim Repeat
" Plug 'tpope/vim-repeat'
Plug 'backdround/vim-repeat'

" Vimwiki
Plug 'vimwiki/vimwiki'

" barbar
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Rainbow bracket
" Plug 'luochen1990/rainbow'

" Plug 'gianarb/coc-grammarly', {'do': 'yarn install --frozen-lockfile'}

" run code in line
" Plug 'metakirby5/codi.vim'

" Project/session management
Plug 'mhinz/vim-startify' ", {'branch': 'center'}

call plug#end()


