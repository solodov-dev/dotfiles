return {
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
		config = function()
			require("barbecue").setup({
				theme = "tokyonight-night",
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		name = "lualine",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lualine").setup({
				options = {
					-- ... your lualine config
					theme = "tokyonight",
					-- ... your lualine config
				},
			})
		end,
	},
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
}
