return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		-- config = function()
		-- 	vim.cmd("colorscheme tokyonight-night")
		-- end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		-- config = function()
		-- 	vim.cmd("colorscheme gruvbox")
		-- end,
	},
	{
		"EdenEast/nightfox.nvim",
		config = function()
			vim.cmd("colorscheme dayfox")
		end,
	},
}
