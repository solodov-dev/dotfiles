return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "mason-org/mason.nvim" },
  opts = {
    -- Formatter binaries used by conform.nvim (see lua/plugins/format.lua).
    -- Conform only runs these; it never installs them, so they live here.
    --
    -- Not listed on purpose:
    --   rustfmt      -> ships with rustup
    --   clang-format -> provided by the system (pacman)
    --   gofmt        -> ships with the Go toolchain (mise)
    ensure_installed = {
      "stylua",
      "prettier",
      "prettierd",
      "eslint_d",
      "gofumpt",
      "goimports",
    },
  },
}
