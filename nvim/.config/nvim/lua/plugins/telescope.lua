return {
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
			"Snikimonkd/telescope-git-conflicts.nvim",
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				extentions = { undo = {}, fzf = { override_generic_sorter = true, override_file_sorter = true } },
				defaults = {
					mappings = {
						i = {
							["<C-p>"] = require("telescope.actions.layout").toggle_preview,
						},
					},
					preview = {
						hide_on_startup = true, -- hide previewer when picker starts
					},
					path_display = {
						filename_first = {
							reverse_directories = false,
						},
					},
				},
				pickers = { find_files = { hidden = true } },
			})
			telescope.load_extension("undo")
			telescope.load_extension("fzf")
			telescope.load_extension("conflicts")
			return telescope.load_extension("ui-select")
		end,
	},
}
