-- Custom Parameters (with defaults)
return {
	"David-Kunz/gen.nvim",
	opts = {
		model = "mistral", -- The default model to use. List of available models: https://ollama.ai/library
		quit_map = "q", -- set keymap for close the response window
		retry_map = "<c-r>", -- set keymap to re-send the current prompt
		accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
		display_mode = "split", -- The display mode. Can be "float" or "split" or "horizontal-split".
		show_prompt = false, -- Shows the prompt submitted to Ollama.
		show_model = false, -- Displays which model you are using at the beginning of your chat session.
		no_auto_close = true, -- Never closes the window automatically.
		hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
		debug = true, -- Prints errors and the command which is run.
	},
	config = function()
		local gen = require("gen")
		vim.keymap.set({ "n", "v" }, "<leader>]", ":Gen<CR>")
		vim.keymap.set({ "n", "v" }, "<leader>[", gen.select_model)
	end,
}
