return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			local mason = require("mason")
			local mason_lsp = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local cmp_lsp = require("cmp_nvim_lsp")
			mason.setup({})
			return mason_lsp.setup({
				ensure_installed = {
					"awk_ls",
					"bashls",
					"clangd",
					"gopls",
					"cssls",
					"cssmodules_ls",
					"docker_compose_language_service",
					"dockerls",
					"emmet_ls",
					"eslint",
					"jsonls",
					"lua_ls",
					"marksman",
					"rust_analyzer",
					"ts_ls",
					"yamlls",
				},
				handlers = {
					function(server_name)
						local capabilities = cmp_lsp.default_capabilities()
						local server = lspconfig[server_name]
						return server.setup({ capabilities })
					end,
				},
			})
		end,
	},
}
