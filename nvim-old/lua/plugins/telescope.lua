-- Awesome Fuzzy Finder
-- https://www.github.com/nvim-telescope/telescope.nvim
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	-- Lodash for lua
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		})

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fs", builtin.git_status, {})
		vim.keymap.set("n", "<leader>fc", builtin.git_commits, {})
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>fl", builtin.git_bcommits, {})
		vim.keymap.set("n", "<leader>fo", builtin.vim_options, {})
		vim.keymap.set("n", "<leader>f*", builtin.grep_string, {})
		vim.keymap.set("n", "<leader>ft", builtin.builtin, {})
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
	end,
}
