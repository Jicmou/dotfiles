vim.pack.add({
	-- Syntax highlighting on steroids
	-- https://www.github.com/nvim-treesitter/nvim-treesitter
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
	{
		src = 'https://github.com/"saghen/blink.cmp',
		version = "v1",
	},
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/mason-org/mason.nvim",

	-- Do crazy stuff with strings
	-- Substitute: search and replace case sensitive and manages plural
	-- Coerction: easily convert string in camelCase, snake_case, TitleCase...
	-- https://www.github.com/tpope/vim-abolish
	"https://github.com/tpope/vim-abolish",

	-- Should-be-builtin-kind-of-plugin
	-- Allows you to surround wih parens, quotes, tags ...
	-- https://www.github.com/tpope/vim-surround
	"https://github.com/tpope/vim-surround",

	-- Repeats also plugin mappings, which is kind of cool.
	-- https://www.github.com/tpope/vim-repeat
	"https://github.com/tpope/vim-repeat",

	-- Git integration so awesome it should be illegal
	"https://www.github.com/tpope/vim-fugitive",

	-- All-in-one formatters
	"https://github.com/mhartington/formatter.nvim",

	"https://www.github.com/lewis6991/gitsigns.nvim",
	"https://www.github.com/iamcco/markdown-preview.nvim",
	"https://www.github.com/olimorris/codecompanion.nvim",
	"https://www.github.com/nvim-lua/plenary.nvim",
	"https://www.github.com/OXY2DEV/markview.nvim",
	"https://www.github.com/nvim-tree/nvim-web-devicons",
	"https://www.github.com/epwalsh/obsidian.nvim",
	"https://www.github.com/stevearc/oil.nvim",
	"https://www.github.com/echasnovski/mini.icons",
	"https://www.github.com/echasnovski/mini.operators",
	"https://www.github.com/nvim-telescope/telescope.nvim",
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})
