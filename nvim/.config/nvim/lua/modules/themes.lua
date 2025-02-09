return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
  },
}
