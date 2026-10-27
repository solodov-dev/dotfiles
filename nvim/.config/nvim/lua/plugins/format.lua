return {
  {
    "stevearc/conform.nvim",
    config = function()
      local conform = require("conform")
      return conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          c = { "clang-format" },
          javascript = { "prettierd", "eslint_d" },
          typescript = { "prettierd", "eslint_d" },
          javascriptreact = { "prettierd", "eslint_d" },
          typescriptreact = { "prettierd", "eslint_d" },
          html = { "prettierd" },
          css = { "prettierd" },
          json = { "prettierd" },
          jsonc = { "prettierd" },
          markdown = { "prettierd" },
          graphql = { "prettierd" },
          rust = { "rustfmt", lsp_format = "fallback" },
          go = { "gofmt", lsp_format = "fallback" },
        },
        format_on_save = { timeout_ms = 5000, lsp_format = "fallback" },
      })
    end,
  },
}
