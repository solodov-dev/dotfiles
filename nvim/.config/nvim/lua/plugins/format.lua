return {
  {
    "stevearc/conform.nvim",
    config = function()
      local conform = require("conform")
      return conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          c = { "clang-format" },
          javascript = { "prettierd", "prettier", "eslint_d" },
          typescript = { "prettierd", "prettier", "eslint_d" },
          javascriptreact = { "prettierd", "prettier", "eslint_d" },
          typescriptreact = { "prettierd", "prettier", "eslint_d" },
          html = { "prettierd", "prettier" },
          css = { "prettierd", "prettier" },
          json = { "prettierd", "prettier" },
          jsonc = { "prettierd", "prettier" },
          markdown = { "prettierd", "prettier" },
          graphql = { "prettierd", "prettier" },
          rust = { "rustfmt", lsp_format = "fallback" },
          go = { "gofmt", lsp_format = "fallback" },
        },
        format_on_save = { timeout_ms = 2500, lsp_format = "fallback" },
      })
    end,
  },
}
