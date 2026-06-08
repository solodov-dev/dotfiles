return {
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")
			return conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					c = { "clang-format" },
					javascript = { "prettierd", "prettier", "eslint" },
					typescript = { "prettierd", "prettier", "eslint" },
					javascriptreact = { "prettierd", "prettier", "eslint" },
					typescriptreact = { "prettierd", "prettier", "eslint" },
					html = { "prettierd", "prettier" },
					css = { "prettierd", "prettier" },
					json = { "prettierd", "prettier" },
					jsonc = { "prettierd", "prettier" },
					markdown = { "prettierd", "prettier" },
					graphql = { "prettierd", "prettier" },
					rust = { "rustfmt", lsp_format = "fallback" },
					go = { "gopls" },
				},
				format_on_save = { timeout_ms = 2500, lsp_format = "fallback" },
			})
		end,
	},
}
