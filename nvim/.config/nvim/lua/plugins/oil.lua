return {
	{
		"stevearc/oil.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local oil = require("oil")
			return oil.setup({
				watch_for_changes = true,
				lsp_file_methods = { enabled = true, autosave_changes = true },
				view_options = { show_hidden = true },
			})
		end,
	},
}
