return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	-- ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		"BufEnter /home/jicmou/notes",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "notes",
				path = "~/notes",
			},
		},
		daily_notes = {
			-- Optional, if you keep daily notes in a separate directory.
			folder = "daily-notes",
			-- Optional, if you want to change the date format for the ID of daily notes.
			date_format = "%Y-%m-%d",
			-- Optional, if you want to change the date format of the default alias of daily notes.
			alias_format = "%B %-d, %Y",
			-- Optional, default tags to add to each new daily note created.
			default_tags = { "daily-notes" },
			-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			template = nil,
		},
		ui = {
			enable = false, -- set to false to disable all additional syntax features
		},

		-- Optional, define your own callbacks to further customize behavior.
		callbacks = {
			-- Runs at the end of `require("obsidian").setup()`.
			post_setup = function()
				-- Open today's diary
				vim.api.nvim_create_user_command("Ot", "ObsidianToday", {})
				-- Open yesterday's diary
				vim.api.nvim_create_user_command("Op", "ObsidianYesterday", {})
				-- Open tomorrow's diary
				vim.api.nvim_create_user_command("On", "ObsidianTomorrow", {})
			end,
		},
	},
}
