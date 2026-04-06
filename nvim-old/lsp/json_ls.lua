return {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc", "json5" },
	single_file_support = true,
	settings = {
		json = {
			schemas = {},
			validate = { enable = true },
			format = { enable = true },
		},
	},
	init_options = {
		provideFormatter = true,
	},
}
