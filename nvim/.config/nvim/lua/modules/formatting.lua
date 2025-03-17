return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "black" },
					-- Use a sub-list to run only the first available formatter
					javascript = { "prettierd", "prettier", stop_after_first = true },
					javascriptreact = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "prettierd", "prettier", stop_after_first = true },
					html = { "prettierd", "prettier", stop_after_first = true },
					css = { "prettierd", "prettier", stop_after_first = true },
					json = { "prettierd", "prettier", stop_after_first = true },
					markdown = { "prettierd", "prettier", stop_after_first = true },
					graphql = { "prettierd", "prettier", stop_after_first = true },
					svelte = { "prettierd", "prettier", stop_after_first = true },
					yaml = { "prettierd", "prettier", stop_after_first = true },
					rust = { "rustfmt", lsp_format = "fallback" },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 2500,
					lsp_fallback = true,
				},
			})
		end,
	},
}
