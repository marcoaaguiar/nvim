-- Bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Gruvbox theme
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use 'EdenEast/nightfox.nvim'

    -- use 'arcticicestudio/nord-vim'
    -- use 'romgrk/doom-one.vim'
    -- use 'shaunsingh/moonlight.nvim'

    -- status line
    use {
        'beauwilliams/statusline.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        }
    }

    -- LSP

    -- LSP Extras
    use 'kosayoda/nvim-lightbulb' -- TODO: Config
    -- look at folke/trouble.nvim


    -- Better file browser
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = function() require'nvim-tree'.setup {} end
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    } -- TODO: is it properly configured?
    use 'fhill2/telescope-ultisnips.nvim'
    use 'matveyt/neoclip' -- do i need this still?
    use {
        "AckslD/nvim-neoclip.lua",
        requires = {'tami5/sqlite.lua', module = 'sqlite'},
    } -- telescope yank

    -- Completion from other opened files
    use 'Shougo/context_filetype.vim'

    -- Surround an text element with (), [], ...
    use 'tpope/vim-surround'

    -- Git change marks
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }

    -- Code commenting
    use 'b3nj5m1n/kommentary'

    -- Latex
    use 'lervag/vimtex'
    use {
        'KeitaNakamura/tex-conceal.vim', ft={'tex',}
    }


    -- Smooth scrolling
    use 'psliwka/vim-smoothie'

    -- Track the engine.
    use 'SirVer/ultisnips'

    -- Snippets are separated from the engine. Add this if you want them:
    use 'honza/vim-snippets'
    use 'reconquest/vim-pythonx'


    -- Goyo (minimalistic view)
    use 'junegunn/goyo.vim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'romgrk/nvim-treesitter-context'

    -- Vim Repeat
    use 'backdround/vim-repeat'

    -- barbar
    use 'romgrk/barbar.nvim'

    -- Project/session management
    -- use 'mhinz/vim-startify' ", {'branch': 'center'}

    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.opts)
        end
    }

    -- Case insensitive substitution, smart auto typo fix, snake case <-> camel case
    use 'tpope/vim-abolish'

    -- Run files
    use 'marcoaaguiar/run.nvim'

    -- Peek line while you jump to line (:23)
    use 'nacro90/numb.nvim'

    use 'lukas-reineke/indent-blankline.nvim'

    -- " Fast movement
    use 'ggandor/lightspeed.nvim'


    -- " auto complet in command line
    -- " :UpdateRemotePlugins needed
    use {'gelguy/wilder.nvim',  run = ':UpdateRemotePlugins', event = 'CmdlineEnter'}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
