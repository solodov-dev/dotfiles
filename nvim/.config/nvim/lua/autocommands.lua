-- Fix eslint errors on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
	command = "silent! EslintFixAll",
	group = vim.api.nvim_create_augroup("solo-js-format", {}),
})

-- Set tsc to compiler when in typescript project
vim.api.nvim_create_autocmd("FileType", {
	pattern = "typescript,typescriptreact",
	group = vim.api.nvim_create_augroup("solo-ts", {}),
	command = "compiler tsc | setlocal makeprg=npx\\ tsc",
})

-- Close deleted files via oil.nvim
vim.api.nvim_create_autocmd("User", {
	pattern = "OilActionsPost",
	callback = function(args)
		local parse_url = function(url)
			return url:match("^.*://(.*)$")
		end

		if args.data.err then
			return
		end

		for _, action in ipairs(args.data.actions) do
			if action.type == "delete" and action.entry_type == "file" then
				local path = parse_url(action.url)
				local bufnr = vim.fn.bufnr(path)
				if bufnr == -1 then
					return
				end

				vim.cmd("bp | bw " .. bufnr)
			end
		end
	end,
})
