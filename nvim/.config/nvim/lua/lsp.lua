return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
		config = function()
			local lsp = require("lsp-zero").preset({})

			-- (Optional) Configure lua language server for neovim
			require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

			lsp.ensure_installed({
				"efm",
				"awk_ls",
				"bashls",
				"clangd",
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
				"tsserver",
				"yamlls",
			})

			lsp.setup()

			require("lspconfig").rust_analyzer.setup({
				assist = {
					importEnforceGranularity = true,
					importPrefix = "crate",
				},
				cargo = {
					allFeatures = true,
				},
				checkOnSave = {
					command = "clippy",
				},
				inlayHints = { locationLinks = false },
				diagnostics = {
					enable = true,
					experimental = {
						enable = true,
					},
				},
			})

			-- You need to setup `cmp` after lsp-zero
			local cmp = require("cmp")
			local cmp_action = require("lsp-zero").cmp_action()

			cmp.setup({
				mapping = {
					-- `Enter` key to confirm completion
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					-- Ctrl+Space to trigger completion menu
					["<C-Space>"] = cmp.mapping.complete(),
					-- Navigate between completion menu items
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					-- Navigate between snippet placeholders
					["<C-f>"] = cmp_action.luasnip_jump_forward(),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),
				},
			})
		end,
	},
	{
		"creativenull/efmls-configs-nvim",
		version = "v1.x.x", -- version is optional, but recommended
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			-- default languages
			local languages = require("efmls-configs.defaults").languages()
			-- languages = vim.tbl_extend('force', languages, {
			-- Custom languages, or override existing ones
			--   html = {
			--     require('efmls-configs.formatters.prettier'),
			--   },
			-- })
			local efmls_config = {
				filetypes = vim.tbl_keys(languages),
				settings = {
					rootMarkers = { ".git/" },
					languages = languages,
				},
				init_options = {
					documentFormatting = true,
					documentRangeFormatting = true,
				},
			}

			require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {
				-- Pass your custom lsp config below like on_attach and capabilities
				--
				-- on_attach = on_attach,
				-- capabilities = capabilities,
			}))
			-- format on save
			local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
			vim.api.nvim_create_autocmd("BufWritePost", {
				group = lsp_fmt_group,
				callback = function(ev)
					local efm = vim.lsp.get_active_clients({ name = "efm", bufnr = ev.buf })

					if vim.tbl_isempty(efm) then
						return
					end

					vim.lsp.buf.format({ name = "efm" })
				end,
			})
		end,
	},
}
