return {
	-- package manager
	-- Easily install and manage LSP servers, DAP servers, linters, and formatters
	"mason-org/mason.nvim",
	config = function()
		require("mason").setup()
	end,
}
