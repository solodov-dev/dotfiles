-- Init lazy.nvim plugin manager.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local function merge_plugins(...)
	local plugins = {}
	for _, tb in ipairs({ ... }) do
		for _, v in ipairs(tb) do
			table.insert(plugins, v)
		end
	end

	return plugins
end

local plugins = merge_plugins(
	require("modules.files"),
	require("modules.git"),
	require("modules.keymaps"),
	require("modules.lsp"),
	require("modules.text"),
	require("modules.themes"),
	require("modules.treesitter"),
	require("modules.ui"),
	require("modules.telescope")
)

require("lazy").setup(plugins)
