local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct


require("lazy").setup({
	-- colorscheme/theme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	-- lsp
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"folke/neodev.nvim",
	-- Configs
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
		config = function()
			require("neoconf").setup()
		end,
	},
	-- Completion
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	"hrsh7th/nvim-cmp",
	-- Comment
	'numToStr/Comment.nvim',
	-- Autopairs
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
	},
	-- Surround/basics/more
	{ 'echasnovski/mini.nvim', version = '*' },
	-- gits sign
	'lewis6991/gitsigns.nvim',
	-- tree sitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		config = function()
			require('nvim-treesitter.configs').setup {
				highlight = { enabled = true }
			}
		end
	},
	-- status line
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	'lambdalisue/nerdfont.vim',
	-- telescope
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	-- tabline
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
	'akinsho/toggleterm.nvim',
	'kyazdani42/nvim-tree.lua',
	'rmagatti/auto-session',
	"norcalli/nvim-colorizer.lua",
	'AndrewRadev/sideways.vim',
})


-- Basic
vim.cmd [[colorscheme tokyonight]]
vim.wo.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.mouse = 'a'
vim.opt.clipboard = "unnamedplus"

-- Comment
require("Comment").setup({ mappings = { basic = true, extra = false } })

-- Lsp
require("mason").setup()
require("mason-lspconfig").setup()

require("neodev").setup({
	-- add any options here, or leave empty to use the default settings
})
require("lspconfig").lua_ls.setup {}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

-- Completion
local cmp = require('cmp')
cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['lua_ls'].setup {
	capabilities = capabilities
}

-- mini
require('mini.animate').setup()
require('mini.basics').setup()
require('mini.surround').setup()

-- git signs
require('gitsigns').setup()

-- status line
require('lualine').setup {}

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.tags, {})
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
--> look into lsp telescopes

-- tabline
vim.opt.termguicolors = true
require("bufferline").setup{}

-- Misc
-- colorize color hexes
require('colorizer').setup()

