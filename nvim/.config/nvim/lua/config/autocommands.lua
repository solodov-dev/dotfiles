do
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
		command = "silent! EslintFixAll",
		group = vim.api.nvim_create_augroup("solo-js-format", {}),
	})
end

return {}
