return {
	{
		"windwp/nvim-ts-autotag",
		config = function()
			local autotag = require("nvim-ts-autotag")
			return autotag.setup({})
		end,
	},
}
