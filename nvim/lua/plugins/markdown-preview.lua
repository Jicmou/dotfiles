return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install && git restore .",
	ft = { "markdown" },
	config = function()
		vim.g.mkdp_filetypes = { "markdown" }
		vim.keymap.set("n", "<leader>mp", vim.cmd.MarkdownPreview, {})
	end,
}
