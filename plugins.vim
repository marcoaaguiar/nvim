if using_neovim
    call plug#begin("~/.config/nvim/plugged")
else
    call plug#begin("~/.vim/plugged")
endif
" " Nerd fonts
Plug 'ryanoasis/vim-devicons'

" " Stable version of coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" " Gruvbox theme
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'
" Plug 'morhetz/gruvbox'
" Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'romgrk/doom-one.vim'
Plug 'shaunsingh/moonlight.nvim'
Plug 'EdenEast/nightfox.nvim'


" " Airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'beauwilliams/statusline.lua'
Plug 'kosayoda/nvim-lightbulb'


" " Better file browser
" Plug 'scrooloose/nerdtree'
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" " Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'fhill2/telescope-ultisnips.nvim'
Plug 'matveyt/neoclip'
Plug 'AckslD/nvim-neoclip.lua'

" Completion from other opened files
Plug 'Shougo/context_filetype.vim'

" " Surround an text element with (), [], ...
Plug 'tpope/vim-surround'

" " Indent text object
" " Plug 'michaeljsmith/vim-indent-object'

" " Git integration
Plug 'tpope/vim-fugitive'

" " Git change marks
" Plug 'mhinz/vim-signify'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" " Guttentag
Plug 'ludovicchabant/vim-gutentags'

" " Python autoimport
" Plug 'mgedmin/python-imports.vim'

" " Comment out lines
Plug 'preservim/nerdcommenter'

" " Plug
" Plug 'kana/vim-arpeggio'

" " List of class and methods in file
Plug 'majutsushi/tagbar'

" " Zoom in window
" Plug 'troydm/zoomwintab.vim'


" " Vimspector
" Plug 'puremourning/vimspector'


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
" Plug 'bootleq/vim-cycle'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Plug 'p00f/nvim-ts-rainbow'
Plug 'romgrk/nvim-treesitter-context'

" Vim Repeat
" Plug 'tpope/vim-repeat'
Plug 'backdround/vim-repeat'

" Vimwiki
Plug 'vimwiki/vimwiki'

" barbar
Plug 'romgrk/barbar.nvim'

" Rainbow bracket
" Plug 'luochen1990/rainbow'

" Plug 'gianarb/coc-grammarly', {'do': 'yarn install --frozen-lockfile'}

" run code in line
" Plug 'metakirby5/codi.vim'

" Project/session management
Plug 'mhinz/vim-startify' ", {'branch': 'center'}

" GraphViz
" Plug 'liuchengxu/graphviz.vim'

" Case insensitive substitution, smart auto typo fix, snake case <-> camel case
Plug 'tpope/vim-abolish'

" Fade inactive buffer
" Plug 'TaDaa/vimade'

"
Plug '~/repos/run.nvim'
Plug 'rafcamlet/coc-nvim-lua'

" Debugger
" Plug 'mfussenegger/nvim-dap'
" Plug 'mfussenegger/nvim-dap-python'

" Plug 'terryma/vim-multiple-cursors'

" Peek line while you jump to line (:23)
Plug 'nacro90/numb.nvim'

" " Show ident lines
" Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'


" Plug 'marcoaaguiar/run.nvim'

" Git diff
Plug 'sindrets/diffview.nvim'

" VSCode like icons
" Plug 'yamatsum/nvim-nonicons'

" Fast movement
Plug 'ggandor/lightspeed.nvim'

" auto complet in command line
" :UpdateRemotePlugins needed
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }


call plug#end()


