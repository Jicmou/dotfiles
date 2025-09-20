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
	"bash_ls",
	"css_ls",
	"docker_compose_ls",
	"docker_ls",
	"html_ls",
	"json_ls",
	"lua_ls",
	"marksman",
	"ts_ls",
	"vue_ls",
	"yaml_ls",
})
