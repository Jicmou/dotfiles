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

		-- Add key binding to open CompanionChat
		vim.keymap.set("n", "<Leader>cc", function()
			vim.cmd([[CodeCompanionChat]])
		end, { noremap = true, silent = true })

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
				ollama = function()
					return adapters.extend("ollama", {
						model = "mistral",
					})
				end,
			},
		})
	end,
}
