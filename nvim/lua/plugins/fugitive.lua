-- https://www.github.com/tpope/vim-fugitive
return {
	-- Git integration so awesome it should be illegal
	"tpope/vim-fugitive",
	config = function()
		-- Choose between 2 diffs when resolving conflicts
		vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
		vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
	end,
}
