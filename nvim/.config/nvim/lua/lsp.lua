return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },             -- Required
      { "williamboman/mason.nvim" },           -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },     -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" },     -- Required
    },
    config = function()
      local lsp = require("lsp-zero").preset({})

      -- (Optional) Configure lua language server for neovim
      require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

      require("mason").setup({});
      require("mason-lspconfig").setup({
        ensure_installed = {
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
          "prettier",
          "prettierd",
          "yamlls",
        }
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
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "isort", "black" },
          -- Use a sub-list to run only the first available formatter
          javascript = { { "prettierd", "prettier" } },
          javascriptreact = { { "prettierd", "prettier" } },
          typescript = { { "prettierd", "prettier" } },
          typescriptreact = { { "prettierd", "prettier" } },
          html = { { "prettierd", "prettier" } },
          css = { { "prettierd", "prettier" } },
          json = { { "prettierd", "prettier" } },
          markdown = { { "prettierd", "prettier" } },
          graphql = { { "prettierd", "prettier" } },
          svelte = { { "prettierd", "prettier" } },
          yaml = { { "prettierd", "prettier" } },
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },
}
