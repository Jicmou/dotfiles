-- Only display diagnostics for the current line
vim.diagnostic.config({ virtual_text = { current_line = true } })

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
