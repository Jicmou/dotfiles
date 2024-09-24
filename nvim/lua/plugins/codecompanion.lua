return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim", -- Optional
		-- {
		--   "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
		--   opts = {},
		-- },
	},
	config = function()
		local codecompanion = require("codecompanion")
		local adapters = require("codecompanion.adapters")
		codecompanion.setup({
			strategies = {
				chat = {
					adapter = "copilot",
				},
				inline = {
					adapter = "copilot",
				},
				agent = {
					adapter = "copilot",
				},
			},
			adapters = {
				anthropic = function()
					return adapters.extend("anthropic", {
						env = {
							api_key = os.getenv("CLAUDE_API_KEY"),
						},
					})
				end,
			},
		})
	end,
}