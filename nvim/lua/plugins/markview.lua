-- https://www.github.com/OXY2DEV/markview.nvim
return {
	"OXY2DEV/markview.nvim",
	lazy = true,
	ft = "markdown",

	split_conf = {
		split = "right",
	},

	-- disable gx mapping that interfers with native gx that I use a lot
	preview = {
		map_gx = false,
	},

	dependencies = {
		-- You will not need this if you installed the
		-- parsers manually
		-- Or if the parsers are in your $RUNTIMEPATH
		"nvim-treesitter/nvim-treesitter",

		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.keymap.set("n", "<leader>mv", function()
			vim.cmd([[Markview toggle]])
		end)

		vim.cmd("Markview disable")
	end,
}
