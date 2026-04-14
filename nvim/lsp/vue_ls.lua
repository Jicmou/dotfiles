local global_ts = vim.fn.stdpath("data")
	.. "/mason/packages"
	.. "/vue-language-server/node_modules"
	.. "/typescript/lib"

return {
	cmd = { "vue-language-server", "--stdio" },
	filetypes = { "vue" },
	init_options = {
		typescript = { tsdk = global_ts },
	},
}
