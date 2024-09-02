return {
	"github/copilot.vim",
	config = function()
		-- Enable copilot
		vim.keymap.set("n", "<leader>ce", function()
			vim.cmd([[Copilot enable]])
		end)

		-- Disable copilot
		vim.keymap.set("n", "<leader>cd", function()
			vim.cmd([[Copilot disable]])
		end)

		-- accept suggestion
		vim.keymap.set("i", "<C-y>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})

		-- accept first word of suggestion
		vim.keymap.set("i", "<C-l>", "<Plug>(copilot-accept-word)")

		-- no tab
		vim.g.copilot_no_tab_map = true

		-- Start neovim with Copilot disabled
		vim.cmd("Copilot disable")
	end,
}
