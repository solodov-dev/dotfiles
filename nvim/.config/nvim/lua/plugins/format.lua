return {
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")
			return conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					c = { "clang-format" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					javascriptreact = { "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "prettierd", "prettier", stop_after_first = true },
					html = { "prettierd", "prettier", stop_after_first = true },
					css = { "prettierd", "prettier", stop_after_first = true },
					json = { "prettierd", "prettier", stop_after_first = true },
					jsonc = { "prettierd", "prettier", stop_after_first = true },
					markdown = { "prettierd", "prettier", stop_after_first = true },
					graphql = { "prettierd", "prettier", stop_after_first = true },
					rust = { "rustfmt", lsp_format = "fallback" },
					go = { "gopls" },
				},
				format_on_save = { timeout_ms = 2500, lsp_format = "fallback" },
			})
		end,
	},
}
