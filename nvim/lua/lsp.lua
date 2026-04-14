vim.diagnostic.config({
	-- Only display diagnostics for the current line
	virtual_text = { current_line = true },
	-- Display floating window with border
	float = { border = "single" },
})

-- Add borders to the floating window displaying definitions
vim.keymap.set("n", "K", "<cmd> lua vim.lsp.buf.hover({ border = 'single' })<CR>")

-- enable lsp
vim.lsp.enable({
	"bashls",
	"css_variables",
	"cssls",
	"docker_compose_language_service",
	"dockerls",
	"eslint",
	"html",
	"jsonls",
	"lua_ls",
	"marksman",
	"ts_ls",
	"vue_ls",
	"yamlls",
})
