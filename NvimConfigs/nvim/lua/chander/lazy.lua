-- This file contains the configuration for setting up the lazy.nvim plugin manager in Neovim.

-- Node.js configuration - always use latest stable version
vim.g.node_host_prog = vim.fn.exepath("node") or "/usr/local/bin/node"
-- Ensure we're using a recent Node version for LSPs and plugins
if vim.fn.executable("node") == 1 then
	local node_version = vim.fn.system("node --version"):gsub("\n", "")
	print("Using Node.js version: " .. node_version)
end

-- Spell-checking
vim.opt.spell = true -- activa spell checker
vim.opt.spelllang = { "en" }

-- Define the path to the lazy.nvim plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if the lazy.nvim plugin is not already installed
if not vim.loop.fs_stat(lazypath) then
    -- Bootstrap lazy.nvim by cloning the repository
    -- stylua: ignore
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath })
end

-- Prepend the lazy.nvim path to the runtime path
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Fix copy and paste in WSL (Windows Subsystem for Linux)
if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "win32yank", -- Use win32yank for clipboard operations
		copy = {
			["+"] = "win32yank.exe -i --crlf", -- Command to copy to the system clipboard
			["*"] = "win32yank.exe -i --crlf", -- Command to copy to the primary clipboard
		},
		paste = {
			["+"] = "win32yank.exe -o --lf", -- Command to paste from the system clipboard
			["*"] = "win32yank.exe -o --lf", -- Command to paste from the primary clipboard
		},
		cache_enabled = false, -- Disable clipboard caching
	}
end

require("lazy").setup({
	{ import = "chander.plugins" },
	{ import = "chander.plugins.lsp" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
