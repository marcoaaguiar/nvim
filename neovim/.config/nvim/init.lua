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
	'saadparwaiz1/cmp_luasnip',
	"hrsh7th/nvim-cmp",
	-- Comment
	'numToStr/Comment.nvim',
	-- Autopairs
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
	},
	-- Surround/basics/more
	{ 'echasnovski/mini.nvim',   version = '*' },
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
	{ 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
	-- terminal
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		keys = "<C-t>",
		opts = { open_mapping = "<C-t>" },
	},
	-- snippets
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp"
	},
	-- filesystem
	'kyazdani42/nvim-tree.lua',

	-- sesion
	'rmagatti/auto-session',
	{
		'rmagatti/session-lens',
		requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
		config = function()
			require('session-lens').setup({ --[[your custom config--]] })
		end
	},
	-- 'AndrewRadev/sideways.vim',
	-- Colorize #hex color
	"norcalli/nvim-colorizer.lua",
	-- task (like vscode)
	'stevearc/overseer.nvim',
	-- copilot
	'zbirenbaum/copilot.lua',
	{ 'AndreM222/copilot-lualine' },
})

-- Basic
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd [[colorscheme tokyonight]]
vim.wo.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.mouse = 'a'
vim.opt.mousescroll = 'ver:30,hor:6'

-- -- open file at last position
-- vim.api.nvim_create_autocmd('BufRead', {
--   callback = function(opts)
--     vim.api.nvim_create_autocmd('BufWinEnter', {
--       once = true,
--       buffer = opts.buf,
--       callback = function()
--         local ft = vim.bo[opts.buf].filetype
--         local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
--         if
--           not (ft:match('commit') and ft:match('rebase'))
--           and last_known_line > 1
--           and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
--         then
--           vim.api.nvim_feedkeys([[g`"]], 'nx', false)
--         end
--       end,
--     })
--   end,
-- })

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
		vim.keymap.set('n', '<space>ff', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

-- Completion
local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.get_selected_entry() ~= nil then
				cmp.select_next_item()
				-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
				-- that way you will only jump inside the snippet region
			elseif require("copilot.suggestion").is_visible() then
				require("copilot.suggestion").accept()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		{ name = 'luasnip' }, -- For luasnip users.
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
require('lualine').setup {
	sections = {
		lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' }, -- I added copilot here
	},
}

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ts', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tt', builtin.tags, {})
vim.keymap.set('n', '<leader>tc', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>td', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>tk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>tr', "<cmd> SearchSession <CR>", {})
--> look into lsp telescopes

-- tabline
vim.opt.termguicolors = true
require("bufferline").setup()

vim.keymap.set('n', '<A-.>', "<cmd> BufferLineCycleNext <CR>", {})
vim.keymap.set('n', '<A-,>', "<cmd> BufferLineCyclePrev <CR>", {})
vim.keymap.set("n", "<A-s-.>", "<cmd> BufferLineMoveNext <CR>") --"  cycle next buffer"
vim.keymap.set("n", "<A-s-,>", "<cmd> BufferLineMovePrev <CR>") --"  cycle prev buffer"
vim.keymap.set("n", "<A-f>", "<cmd> BufferLinePick <CR>")
vim.keymap.set("n", "<A-w>", "<cmd> bp|sp|bn|bd! <CR>")         --"	close buffer"
for i = 1, 9 do
	-- map("n", "<A-" .. i .. ">", function() require("bufferline").go_to_buffer(i) end)
	vim.keymap.set("n", "<A-" .. i .. ">", "<cmd>" .. i .. "tabn<CR>")
end

-- filesystem
require("nvim-tree").setup { update_focused_file = { enable = true } }

vim.keymap.set("n", "<space>fc", "<cmd> NvimTreeClose <CR>")
vim.keymap.set("n", "<space>ft",
	function()
		if require('nvim-tree.api').tree.is_tree_buf() then
			vim.cmd("NvimTreeClose")
		else
			return vim.cmd("NvimTreeFindFile")
		end
	end)

-- session
require('auto-session').setup {
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/Projects", },
}
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Tasks
require('overseer').setup()

-- Copilot
require('copilot').setup {
	suggestion = {
		auto_trigger = true
	}
}

vim.keymap.set('n', '<leader>cc', "<cmd> Copilot panel<CR>", {})
-- Misc
-- colorize color hexes
require('colorizer').setup()
