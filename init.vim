let debug = 0

if !debug
    source ~/.config/nvim/basic.vim
    source ~/.config/nvim/plugins.vim
    source ~/.config/nvim/themes.vim
    source ~/.config/nvim/filetypes.vim
    " " source ~/.config/nvim/init.vim.bkup
    source ~/.config/nvim/plug-config/coc.vim
    source ~/.config/nvim/plug-config/gutentags.vim
    source ~/.config/nvim/plug-config/vim-fugitive.vim
    " source ~/.config/nvim/plug-config/nerdtree.vim
    source ~/.config/nvim/plug-config/chadtree.vim
    source ~/.config/nvim/plug-config/nerdcommenter.vim
    source ~/.config/nvim/plug-config/airline.vim
    source ~/.config/nvim/plug-config/fzf.vim
    source ~/.config/nvim/plug-config/tagbar.vim
    " source ~/.config/nvim/plug-config/indentLine.vim
    source ~/.config/nvim/plug-config/vimsepctor.vim
    source ~/.config/nvim/plug-config/signify.vim
    source ~/.config/nvim/plug-config/vimtex.vim
    source ~/.config/nvim/plug-config/tex-conceal.vim
    source ~/.config/nvim/plug-config/ultisnips.vim
    source ~/.config/nvim/plug-config/goyo.vim
    source ~/.config/nvim/plug-config/vim-cycle.vim
    source ~/.config/nvim/plug-config/treesitter.vim
    source ~/.config/nvim/plug-config/vim-repeat.vim
    source ~/.config/nvim/plug-config/vim-wiki.vim
    source ~/.config/nvim/plug-config/barbar.vim
    source ~/.config/nvim/plug-config/rainbow.vim
    " source ~/.config/nvim/plug-config/codi.vim
    source ~/.config/nvim/plug-config/startify.vim
    source ~/.config/nvim/colemak.vim
    source ~/.config/nvim/term.vim
    source ~/.config/nvim/shortcuts.vim
    source ~/.config/nvim/run.vim
    source ~/.config/nvim/setup.vim

    " colorscheme nord
    colorscheme gruvbox
    " colorscheme doom-one

    " set runtimepath^=~/repos/coc-grammarly/
else
    " source ~/.config/nvim/debug.vim
    source ~/.config/nvim/colemak.vim
endif
