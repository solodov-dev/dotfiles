return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"rust",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"css",
					"javascript",
					"html",
					"typescript",
					"markdown",
					"bash",
					"tsx",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
