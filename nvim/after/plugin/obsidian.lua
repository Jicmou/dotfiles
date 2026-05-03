require("obsidian").setup({
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

	notes_subdir = "0-inputs",

	-- Where to put new notes. Valid options are
	--  * "current_dir" - put new notes in same directory as the current buffer.
	--  * "notes_subdir" - put new notes in the default notes subdirectory.
	new_notes_location = "notes_subdir",

	-- Optional, customize how note IDs are generated given an optional title.
	---@param title string|?
	---@return string
	note_id_func = function(title)
		-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
		-- In this case a note with the title 'My new note' will be given an ID that looks
		-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
		local suffix = ""
		if title ~= nil then
			-- If title is given, transform it into valid file name.
			suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		else
			-- If title is nil, just add 4 random uppercase letters to the suffix.
			for _ = 1, 4 do
				suffix = suffix .. string.char(math.random(65, 90))
			end
		end
		return tostring(os.time()) .. "-" .. suffix
	end,
})

vim.keymap.set("n", "<leader>ot", vim.cmd.ObsidianToday)
vim.keymap.set("n", "<leader>oy", vim.cmd.ObsidianYesterday)
vim.keymap.set("n", "<leader>on", vim.cmd.ObsidianNew)
vim.keymap.set("n", "<leader>os", vim.cmd.ObsidianSearch)
