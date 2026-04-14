-- We need to get the vue-typescript-plugin path.
-- As it's a dependency of vue-language-server installed by Mason,
-- we get it from here.
local vue_typescript_plugin = vim.fn.stdpath("data")
	.. "/mason/packages/vue-language-server/node_modules"
	.. "/@vue/language-server/node_modules"
	.. "/@vue/typescript-plugin"

return {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue", -- We add vue here to have sfc covered by tsserver.
	},
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_typescript_plugin,
				languages = { "javascript", "typescript", "vue" },
			},
		},
	},
}
