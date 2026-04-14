local function gh(pluginName)
	return "https://github.com/" .. pluginName
end

vim.pack.add({
	-- Syntax highlighting on steroids
	-- https://www.github.com/nvim-treesitter/nvim-treesitter
	{ src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
	{ src = gh("saghen/blink.cmp"), version = "v1" },
	gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
	gh("mason-org/mason.nvim"),

	-- Do crazy stuff with strings
	-- Substitute: search and replace case sensitive and manages plural
	-- Coerction: easily convert string in camelCase, snake_case, TitleCase...
	-- https://www.github.com/tpope/vim-abolish
	gh("tpope/vim-abolish"),

	-- Should-be-builtin-kind-of-plugin
	-- Allows you to surround wih parens, quotes, tags ...
	-- https://www.github.com/tpope/vim-surround
	gh("tpope/vim-surround"),

	-- Repeats also plugin mappings, which is kind of cool.
	-- https://www.github.com/tpope/vim-repeat
	gh("tpope/vim-repeat"),

	-- Git integration so awesome it should be illegal
	gh("tpope/vim-fugitive"),

	-- All-in-one formatters
	gh("mhartington/formatter.nvim"),

	gh("lewis6991/gitsigns.nvim"),
	gh("iamcco/markdown-preview.nvim"),
	gh("olimorris/codecompanion.nvim"),
	gh("nvim-lua/plenary.nvim"),
	gh("OXY2DEV/markview.nvim"),
	gh("nvim-tree/nvim-web-devicons"),
	gh("epwalsh/obsidian.nvim"),
	gh("stevearc/oil.nvim"),
	gh("echasnovski/mini.icons"),
	gh("echasnovski/mini.operators"),
	gh("nvim-telescope/telescope.nvim"),
	{ src = gh("catppuccin/nvim"), name = "catppuccin" },
	gh("neovim/nvim-lspconfig"),
})
