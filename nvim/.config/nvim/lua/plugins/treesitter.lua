return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = "*",
        callback = function()
          -- can start a specific treesitter on a specific buffer also
          -- vim.treesitter.start(0, "c")
          vim.treesitter.start()
        end,
        once = true,
      })
      local ts = require("nvim-treesitter.config")
      return ts.setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "rust",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "css",
          "javascript",
          "html",
          "typescript",
          "markdown",
          "bash",
          "tsx",
          "c",
          "clojure",
          "dockerfile",
          "yaml",
          "go",
        },
      })
    end,
  },
}
