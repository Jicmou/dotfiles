-- package manager
-- Easily install and manage LSP servers, DAP servers, linters, and formatters
-- https://www.github.com/mason-org/mason.nvim
return {
	"mason-org/mason.nvim",
	config = function()
		require("mason").setup()
	end,
}
