-- Load configuration files

-- Load settings
require("set")

-- Load global remaps
require("remap")

-- Load lsp configs
require("lsp")

-- Lazy plugin manager
--
-- Define path for Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Install Lazy if not already present
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none", -- Faster clone by filtering blobs
		"https://github.com/folke/lazy.nvim.git", -- Repository URL
		"--branch=stable", -- Use stable release branch
		lazypath, -- Destination path
	})
end

-- Add Lazy to Vim runtime path (for plugin loading)
vim.opt.rtp:prepend(lazypath)

-- Initialize Lazy with plugins configuration
require("lazy").setup("plugins")
