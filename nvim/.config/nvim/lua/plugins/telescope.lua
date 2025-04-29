return {
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local themes = require("telescope.themes")
			telescope.setup({
				extentions = { undo = {}, fzf = { override_generic_sorter = true, override_file_sorter = true } },
				defaults = themes.get_ivy({}),
				pickers = { find_files = { hidden = true } },
			})
			telescope.load_extension("undo")
			telescope.load_extension("fzf")
			return telescope.load_extension("ui-select")
		end,
	},
}
