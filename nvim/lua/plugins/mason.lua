return {
	-- package manager
  -- Easily install and manage LSP servers, DAP servers, linters, and formatters
	"williamboman/mason.nvim",
  config = function ()
    require("mason").setup()
  end,
}
