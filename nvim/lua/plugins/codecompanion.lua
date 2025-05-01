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
		-- if a chat is already open, this will override the previous chat
		vim.keymap.set("n", "<Leader>cco", function()
			vim.cmd([[CodeCompanionChat]])
		end, { noremap = true, silent = true })

		-- Add key binding to toggle CompanionChat
		-- If no chat is open, it will create one
		vim.keymap.set("n", "<Leader>cct", function()
			vim.cmd([[CodeCompanionChat Toggle]])
		end, { noremap = true, silent = true })

		-- Explains lsp diagnostics on the visually selected text
		vim.keymap.set("v", "<Leader>cct", function()
			vim.cmd([[CodeCompanion /lsp]])
		end, { noremap = true, silent = true })

		-- Add key binding to open CompanionChat and explain lsp diagnostics
		vim.keymap.set("n", "<Leader>ccd", function()
			vim.cmd([[CodeCompanionChat #lsp]])
		end, { noremap = true, silent = true })

		-- Explain selected text in a new chat
		vim.keymap.set("v", "<Leader>cce", function()
			vim.cmd([[CodeCompanion /explain]])
		end, { noremap = true, silent = true })

		codecompanion.setup({
			strategies = {
				chat = {
					adapter = "copilot",
				},
				inline = {
					adapter = "copilot",
					keymaps = {
						accept_change = {
							modes = { n = "ga" },
							description = "Accept the suggested change",
						},
						reject_change = {
							modes = { n = "gr" },
							description = "Reject the suggested change",
						},
					},
					layout = "vertical", -- vertical|horizontal|buffer
				},
				agent = {
					adapter = "copilot",
				},
			},
			adapters = {
				opts = {
					show_defaults = false,
				},
				copilot = function()
					return require("codecompanion.adapters").extend("copilot", {
						schema = { model = { default = "claude-3.7-sonnet" } },
					})
				end,
				ollama = function()
					return adapters.extend("ollama", {
						schema = { model = { default = "qwen2.5-coder:7b" } },
					})
				end,
			},
			display = {
				chat = { show_settings = false },
				diff = {
					enabled = true,
					close_chat_at = 0, -- Close an open chat buffer if the total columns of your display are less than...
					layout = "horizontal", -- vertical|horizontal split for default provider
					opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
					provider = "default", -- default|mini_diff
				},
			},
		})
	end,
}
