return {
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			local nvim_surround = require("nvim-surround")
			return nvim_surround.setup({})
		end,
	},
}
