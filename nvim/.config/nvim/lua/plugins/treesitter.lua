return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter.configs")
			return ts.setup({
				highlight = { enable = true },
				indent = { enable = true },
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
					"c",
					"clojure",
					"dockerfile",
					"yaml",
				},
			})
		end,
	},
}
