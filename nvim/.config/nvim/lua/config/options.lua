do
	local options = {
		tabstop = 2,
		shiftwidth = 2,
		expandtab = true,
		softtabstop = 2,
		nu = true,
		relativenumber = true,
		smartindent = true,
		hlsearch = true,
		incsearch = true,
		termguicolors = true,
		scrolloff = 8,
		signcolumn = "yes",
		updatetime = 50,
		colorcolumn = "80",
		clipboard = "unnamedplus",
		wrap = false,
	}

	for option, value in pairs(options) do
		vim.o[option] = value
	end
end

return {}
