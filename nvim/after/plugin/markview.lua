vim.keymap.set("n", "<leader>mv", function()
	vim.cmd([[Markview toggle]])
end)

vim.cmd("Markview disable")
