-- ready-to-go lsp config ta have a nice start
return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ -- Optional
			"williamboman/mason.nvim",
			cmd = function()
				---@diagnostic disable-next-line: param-type-mismatch
				pcall(vim.cmd, "MasonUpdate")
			end,
		},
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "L3MON4D3/LuaSnip" }, -- Required
	},
	config = function()
		local lsp_zero = require("lsp-zero").preset({})
		local lsp_config = require("lspconfig")

		lsp_zero.preset("recommended")

		---@diagnostic disable-next-line: unused-local
		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		require("mason").setup({})

		-- make sure these servers are installed
		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				-- Not sure why I want to ensure those,
				-- while automatic_installation should install them anyway
				"lua_ls",
				"ts_ls",
				-- Need to declare those as they're needed by formatter.nvim
				-- but are not detected by automatic_installation.
				-- "prettier",
				-- "fixjson",
				-- "shfmt",
				-- "stylua",
			},
		})

		lsp_config.cssls.setup({})

		lsp_config.eslint.setup({})

		--Enable (broadcasting) snippet capability for completion
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		require("lspconfig").html.setup({
			capabilities = capabilities,
		})

		lsp_config.yamlls.setup({
			on_attach = function(client)
				-- get first line of current buffer
				local firstLine = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]

				-- check if first lines begins with "apiVersion:"
				local isKubernetes = string.match(string.sub(firstLine, 1, 11), "apiVersion:")

				if isKubernetes then
					client.config.settings.yaml.schemas = {
						["Kubernetes"] = "/*.yaml",
					}

					client.notify("workspace/didChangeConfiguration", {
						settings = client.config.settings,
					})
				end
			end,

			settings = {
				yaml = {
					schemas = {},
				},
				redhat = { telemetry = { enabled = false } },
			},
		})

		lsp_config.stylelint_lsp.setup({
			filetypes = {
				"css",
				"scss",
			},
		})

		lsp_config.jsonls.setup({
			filetypes = { "json", "jsonc" },
			provideFormatter = true,
			capabilities = capabilities,
		})

		-- (Optional) Configure lua language server for neovim
		lsp_config.lua_ls.setup({
			filetypes = { "lua" },
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})

		-- Markdown language server
		lsp_config.marksman.setup({})

		lsp_config.rust_analyzer.setup({})

		-- TOML language server
		lsp_config.taplo.setup({})

		lsp_config.bashls.setup({})

		lsp_config.svelte.setup({})

		lsp_config.terraformls.setup({})

		lsp_config.ruby_lsp.setup({})

		lsp_config.dockerls.setup({})

		lsp_config.docker_compose_language_service.setup({})

		-- @TODO: Find a way to configure denols to run only on deno projects
		-- lsp_config.denols.setup({})

		lsp_zero.setup()

		-- Make sure you setup `cmp` after lsp-zero
		local cmp = require("cmp")

		cmp.setup({
			-- completion = {
			--   autocomplete = false
			-- },
			mapping = {
				["<C-Space>"] = cmp.mapping.complete(),
			},
		})
	end,
}
