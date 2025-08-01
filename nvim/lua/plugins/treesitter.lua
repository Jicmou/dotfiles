-- Syntax highlighting on steroids
-- https://www.github.com/nvim-treesitter/nvim-treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			modules = {},
			ignore_install = {},

			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = {
				"bash",
				"c",
				"cmake",
				"css",
				"csv",
				"dockerfile",
				"dot",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"gpg",
				"html",
				"http",
				"javascript",
				"jq",
				"jsdoc",
				"json",
				"json5",
				"jsonc",
				"lua",
				"luadoc",
				"make",
				"markdown",
				"markdown_inline",
				"mermaid",
				"passwd",
				"po",
				"python",
				"query",
				"regex",
				"ruby",
				"rust",
				"scss",
				"sql",
				"terraform",
				"tmux",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"vue",
				"xml",
				"yaml",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			-- List of parsers to ignore installing (or "all")
			-- ignore_install = { "javascript" },

			---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
			-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

			highlight = {
				enable = true,

				-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
				-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
				-- the name of the parser)
				-- list of language that will be disabled
				-- disable = { "c", "rust" },

				-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
				-- disable = function(lang, buf)
				--     local max_filesize = 100 * 1024 -- 100 KB
				--     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				--     if ok and stats and stats.size > max_filesize then
				--         return true
				--     end
				-- end,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>gnn", -- set to `false` to disable one of the mappings
					node_incremental = "<leader>grn",
					scope_incremental = "<leader>grc",
					node_decremental = "<leader>grm",
				},
			},

			indent = { enable = true },
		})
	end,
}
