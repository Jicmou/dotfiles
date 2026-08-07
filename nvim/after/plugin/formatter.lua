vim.cmd("packadd formatter.nvim")

-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},

		html = {
			require("formatter.filetypes.html").prettier,
		},

		css = {
			require("formatter.filetypes.css").prettier,
		},

		typescript = {
			require("formatter.filetypes.javascript").prettier,
		},

		react = {
			require("formatter.filetypes.javascript").prettier,
		},

		typescriptreact = {
			require("formatter.filetypes.javascript").prettier,
		},

		vue = {
			require("formatter.filetypes.javascript").prettier,
		},

		svelte = {
			require("formatter.filetypes.javascript").prettier,
		},

		json = {
			require("formatter.filetypes.json").prettier,
		},

		markdown = {
			require("formatter.filetypes.javascript").prettier,
		},

		sh = {
			require("formatter.filetypes.sh").shfmt,
		},

		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

-- Format on save
local formatAutogroup = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	callback = function()
		vim.cmd("FormatWrite")
	end,
	group = formatAutogroup,
})

-- Format code key mappings
vim.keymap.set("n", "<leader>gq", vim.cmd.Format, {})

-- Global variable to track if format on save is enabled
local format_on_save_enabled = true

-- Command to toggle formatting on save
vim.api.nvim_create_user_command("ToggleFormatOnSave", function()
	format_on_save_enabled = not format_on_save_enabled
	if format_on_save_enabled then
		vim.cmd("augroup FormatAutogroup | autocmd! | autocmd BufWritePost * silent! lua vim.cmd('FormatWrite')")
		print("format on save enabled")
	else
		vim.cmd("augroup FormatAutogroup | autocmd!")
		print("format on save disabled")
	end
end, {})

-- Key binding to toggle format on save
vim.api.nvim_set_keymap("n", "<leader>gt", ":lua vim.cmd('ToggleFormatOnSave')<CR>", { noremap = true, silent = true })
-- ...existing code...
