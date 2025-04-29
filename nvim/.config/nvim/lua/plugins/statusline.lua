return {
	{
		"nvim-lualine/lualine.nvim",
		name = "lualine",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")
			return lualine.setup({ options = { theme = "auto" } })
		end,
	},
}
